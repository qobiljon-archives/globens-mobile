import 'package:globens_flutter_client/generated_protos/gb_service.pb.dart';
import 'package:globens_flutter_client/entities/GlobensUser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:kakao_flutter_sdk/user.dart';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';
import 'dart:convert' as JSON;
import 'dart:io';

class AppUser {
  // region Constructor & init function
  factory AppUser() {
    return _singleton;
  }

  AppUser._internalConstructor();

  static Future<void> init() async {
    AppUser._singleton = AppUser._internalConstructor();
    AppUser.userPrefs = await SharedPreferences.getInstance();
    if (AppUser.userPrefs.containsKey("authMethod"))
      AppUser.setProfileInfo(
          AuthMethod.values[AppUser.userPrefs.getInt("authMethod")],
          AppUser.userPrefs.getInt("id"), AppUser.userPrefs.getString("email"),
          AppUser.userPrefs.getString("displayName"),
          AppUser.userPrefs.getString("profileImageUrl"),
          AppUser.userPrefs.getString("sessionKey"));

    // setup kakao, google, and facebook auth
    KakaoContext.clientId =
    "25bf75f9c559f5f1f78da11571eb818a"; // KakaoContext.javascriptClientId = "678dcd86c1cfc8f0c83d6df0d96d2366" // not yet supported
    googleSignIn = GoogleSignIn(scopes: [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/userinfo.profile',
      'openid'
    ]);
    // todo setup phone, apple
  }

  // endregion

  // region Variables
  static AppUser _singleton;
  static GoogleSignIn googleSignIn;
  static SharedPreferences userPrefs;

  static AuthMethod _authMethod = AuthMethod.NONE;
  static int _id;
  static String _email;
  static String _displayName;
  static String _profileImageUrl;
  static String _sessionKey;

  static AuthMethod get authMethod {
    return _authMethod;
  }

  static int get id {
    return _id;
  }

  static String get email {
    return _email;
  }

  static String get displayName {
    return _displayName;
  }

  static String get profileImageUrl {
    return _profileImageUrl;
  }

  static String get sessionKey {
    return _sessionKey;
  }

  // endregion

  // region Setters & getters
  static void setProfileInfo(AuthMethod authMethod, int id, String email,
      String displayName, String profileImageUrl, String sessionKey) {
    AppUser._authMethod = authMethod;
    AppUser._id = id;
    AppUser._email = email;
    AppUser._displayName = displayName;
    AppUser._profileImageUrl = profileImageUrl;
    AppUser._sessionKey = sessionKey;
  }

  static void clearProfileInfo() {
    AppUser._authMethod = AuthMethod.NONE;
    AppUser._id = null;
    AppUser._email = null;
    AppUser._displayName = null;
    AppUser._profileImageUrl = null;
  }

  // endregion

  // region Utility functions
  static Future<bool> signIn(AuthMethod authMethod) async {
    switch (authMethod) {
      case AuthMethod.KAKAO:
        Tuple2<User, Map> tp = await AppUser._kakaoAuth();

        if (tp != null) {
          User user = tp.item1;
          Map tokens = tp.item2;
          Tuple3<bool, int, String> res = await gprcAuthenticateUser(AuthenticateUser_AuthMethod.KAKAOTALK, JSON.jsonEncode(tokens));

          bool success = res.item1;
          print(success);
          int userId = res.item2;
          String sessionKey = res.item3;
          if (success) {
            AppUser.setProfileInfo(
                AuthMethod.KAKAO, userId, user.kakaoAccount.email,
                user.kakaoAccount.profile.nickname,
                user.kakaoAccount.profile.profileImageUrl.toString(),
                sessionKey);
            AppUser.updateUserPrefsData();
          }
        }
        return false;

      case AuthMethod.GOOGLE:
        if (await AppUser.googleSignIn.isSignedIn()) await AppUser.googleSignIn.signOut();
        Tuple2<GoogleSignInAccount, Map> tp = await AppUser._googleAuth();
        if (tp != null) {
          GoogleSignInAccount user = tp.item1;
          Map tokens = tp.item2;
          Tuple3<bool, int, String> res = await gprcAuthenticateUser(AuthenticateUser_AuthMethod.GOOGLE, JSON.jsonEncode(tokens));

          bool success = res.item1;
          int userId = res.item2;
          String sessionKey = res.item3;
          if (success) {
            AppUser.setProfileInfo(
                AuthMethod.GOOGLE, userId, user.email, user.displayName,
                user.photoUrl, sessionKey);
            AppUser.updateUserPrefsData();
            return true;
          }
        }
        return false;

      case AuthMethod.FACEBOOK:
        return false;

      default:
        return false;
    }
  }

  static Future<void> signOut() async {
    if (AppUser.isAuthenticated()) {
      switch (AppUser._authMethod) {
        case AuthMethod.PHONE:
          break;
        case AuthMethod.KAKAO:
          break;
        case AuthMethod.GOOGLE:
          await googleSignIn.signOut();
          await userPrefs.clear();
          AppUser.clearProfileInfo();
          break;
        case AuthMethod.FACEBOOK:
          break;
        case AuthMethod.APPLE:
          break;
        default:
          break;
      }
    }
    return null;
  }

  static void updateUserPrefsData() {
    userPrefs.setInt("authMethod", AppUser._authMethod.index);
    userPrefs.setInt("id", AppUser._id);
    userPrefs.setString("email", AppUser._email);
    userPrefs.setString("displayName", AppUser._displayName);
    userPrefs.setString("profileImageUrl", AppUser._profileImageUrl);
    userPrefs.setString("sessionKey", AppUser._sessionKey);
  }

  static bool isAuthenticated() {
    return _authMethod != AuthMethod.NONE;
  }

  static Future<GlobensUser> getMyGlobensUser() async {
    http.Response response = await http.get(_profileImageUrl);
    if (response.statusCode == HttpStatus.ok)
      return GlobensUser.create(_id, _email, _displayName, _profileImageUrl, response.bodyBytes);
    return null;
  }

  // endregion

  // region 3rd-party auth methods
  static Future<AccessTokenResponse> _getKakaoAccessToken() async {
    String authCode;
    if (await isKakaoTalkInstalled())
      authCode = await AuthCodeClient.instance.requestWithTalk(); // app
    else
      authCode = await AuthCodeClient.instance.request(); // web

    if (authCode != null)
      return await AuthApi.instance.issueAccessToken(authCode); // get token
    else
      return null;
  }
  static Future<Tuple2<User, Map>> _kakaoAuth() async {
    Map<String, dynamic> tokens = {};

    AccessToken token = await AccessTokenStore.instance.fromStore();

    if (token.accessToken == null) {
      // token locally unavailable
      try {
        var token = await _getKakaoAccessToken();
        AccessTokenStore.instance.toStore(token);

        tokens.putIfAbsent("accessToken", () => token.accessToken);
        tokens.putIfAbsent("expiresIn", () => token.expiresIn);
        tokens.putIfAbsent("refreshToken", () => token.refreshToken);
        tokens.putIfAbsent("refreshTokenExpiresIn", () => token.refreshTokenExpiresIn);
        tokens.putIfAbsent("scopes", () => token.scopes);
        tokens.putIfAbsent("tokenType", () => token.tokenType);

        return Tuple2(await UserApi.instance.me(), tokens);
      } catch (e) {
        print(e);
      }
    } else {
      // token locally available
      final now = DateTime.now().millisecondsSinceEpoch;
      final accessTokenExpiresIn = (token.accessTokenExpiresAt.millisecondsSinceEpoch - now) ~/ 1000;
      final refreshTokenExpiresIn = (token.refreshTokenExpiresAt.millisecondsSinceEpoch - now) ~/ 1000;

      if (accessTokenExpiresIn < 0 || refreshTokenExpiresIn < 0) {
        // the token is old (expired)
        var token = await _getKakaoAccessToken();
        AccessTokenStore.instance.toStore(token);

        tokens.putIfAbsent("accessToken", () => token.accessToken);
        tokens.putIfAbsent("expiresIn", () => token.expiresIn);
        tokens.putIfAbsent("refreshToken", () => token.refreshToken);
        tokens.putIfAbsent("refreshTokenExpiresIn", () => token.refreshTokenExpiresIn);
        tokens.putIfAbsent("scopes", () => token.scopes);
      } else {
        // the token is active
        tokens.putIfAbsent("accessToken", () => token.accessToken);
        tokens.putIfAbsent("expiresIn", () => accessTokenExpiresIn);
        tokens.putIfAbsent("refreshToken", () => token.refreshToken);
        tokens.putIfAbsent("refreshTokenExpiresIn", () => refreshTokenExpiresIn);
        tokens.putIfAbsent("scopes", () => token.scopes);
      }

      return Tuple2(await UserApi.instance.me(), tokens);
    }
    return null; // todo when token is locally available, return it
  }

  static Future<Tuple2<GoogleSignInAccount, Map>> _googleAuth() async {
    Map<String, dynamic> tokens = {};

    GoogleSignInAccount account = await AppUser.googleSignIn.signIn();
    print(account.displayName);
    if (account != null) {
      GoogleSignInAuthentication auth = await account.authentication;

      tokens.putIfAbsent("idToken", () => auth.idToken);
      tokens.putIfAbsent("accessToken", () => auth.accessToken);
      tokens.putIfAbsent("serverAuthCode", () => auth.serverAuthCode);
      return Tuple2(account, tokens);
    }

    return null;
  }
// endregion
}

enum AuthMethod { NONE, PHONE, KAKAO, GOOGLE, FACEBOOK, APPLE }
