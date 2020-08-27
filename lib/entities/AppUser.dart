import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:globens_flutter_client/generated_protos/gb_service.pb.dart';
import 'package:globens_flutter_client/main.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:kakao_flutter_sdk/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';
import 'dart:convert' as JSON;

class AppUser {
  // region Constructor & init function
  factory AppUser() {
    return _singleton;
  }

  AppUser._internalConstructor();

  static void init() async {
    AppUser._singleton = AppUser._internalConstructor();
    AppUser.userPrefs = await SharedPreferences.getInstance();
    if (AppUser.userPrefs.containsKey("authMethod")) AppUser.setProfileInfo(AuthMethod.values[AppUser.userPrefs.getInt("authMethod")], AppUser.userPrefs.getString("email"), AppUser.userPrefs.getString("displayName"), AppUser.userPrefs.getString("profileImageUrl"));

    // setup Kakao auth
    KakaoContext.clientId = "25bf75f9c559f5f1f78da11571eb818a";
    // KakaoContext.javascriptClientId = "678dcd86c1cfc8f0c83d6df0d96d2366" // not yet supported

    // setup google auth, etc.
    googleSignIn = GoogleSignIn(scopes: ['https://www.googleapis.com/auth/userinfo.email', 'https://www.googleapis.com/auth/userinfo.profile', 'openid']);

    // todo setup phone, facebook, apple
  }

  // endregion

  // region Variables
  static AppUser _singleton;
  static GoogleSignIn googleSignIn;
  static FacebookLogin facebookLogin;
  static SharedPreferences userPrefs;

  static AuthMethod _authMethod = AuthMethod.NONE;
  static String _email;
  static String _displayName;
  static String _profileImageUrl;

  // endregion

  // region Setters & getters
  static void setProfileInfo(AuthMethod authMethod, String email, String displayName, String profileImageUrl) {
    AppUser._authMethod = authMethod;
    AppUser._email = email;
    AppUser._displayName = displayName;
    AppUser._profileImageUrl = profileImageUrl;
  }

  static void clearProfileInfo() {
    AppUser._authMethod = AuthMethod.NONE;
    AppUser._email = null;
    AppUser._displayName = null;
    AppUser._profileImageUrl = null;
  }

  static String get email {
    return AppUser._email;
  }

  static String get displayName {
    return AppUser._displayName;
  }

  static String get profileImageUrl {
    return AppUser._profileImageUrl;
  }

  // endregion

  // region Utility functions
  static Future<bool> signIn(AuthMethod authMethod) async {
    switch (authMethod) {
      case AuthMethod.KAKAO:
        Tuple2<User, Map> tp = await AppUser._kakaoAuth();
        User user = tp.item1;
        Map tokens = tp.item2;

        if (tp == null || !await gprcAuthenticateUser(AuthenticateUser_AuthMethod.KAKAOTALK, JSON.jsonEncode(tokens))) return false;

        AppUser.setProfileInfo(AuthMethod.KAKAO, user.kakaoAccount.email, user.kakaoAccount.profile.nickname, user.kakaoAccount.profile.profileImageUrl.toString());
        AppUser.updateUserPrefsData();
        return true;
      case AuthMethod.GOOGLE:
        Tuple2<GoogleSignInAccount, Map> tp = await AppUser._googleAuth();
        GoogleSignInAccount user = tp.item1;
        Map tokens = tp.item2;

        if (tp == null || !await gprcAuthenticateUser(AuthenticateUser_AuthMethod.GOOGLE, JSON.jsonEncode(tokens))) return false;

        AppUser.setProfileInfo(AuthMethod.GOOGLE, user.email, user.displayName, user.photoUrl);
        AppUser.updateUserPrefsData();
        return true;
      case AuthMethod.FACEBOOK:
        Tuple2<Map, Map> tp = await AppUser._facebookAuth();
        Map user = tp.item1;
        Map tokens = tp.item2;

        if (tp == null || !await gprcAuthenticateUser(AuthenticateUser_AuthMethod.FACEBOOK, JSON.jsonEncode(tokens))) return false;

        AppUser.setProfileInfo(AuthMethod.FACEBOOK, user["email"], user["name"], user["picture"]["data"]["url"]);
        AppUser.updateUserPrefsData();
        return true;
      case AuthMethod.PHONE:
        Object user = await AppUser._phoneAuth(); // todo change once phone auth is finished
        if (user == null) return false;

        AppUser.setProfileInfo(AuthMethod.PHONE, null, null, null);
        AppUser.updateUserPrefsData();
        return true;
      case AuthMethod.APPLE:
        Object user = await AppUser._appleAuth(); // todo change once apple auth is finished
        if (user == null)
          return false;
        else {
          AppUser.setProfileInfo(AuthMethod.APPLE, null, null, null);
          AppUser.updateUserPrefsData();
        }
        return true;
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
          await facebookLogin.logOut();
          await userPrefs.clear();
          AppUser.clearProfileInfo();
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
    userPrefs.setString("email", AppUser._email);
    userPrefs.setString("displayName", AppUser._displayName);
    userPrefs.setString("profileImageUrl", AppUser._profileImageUrl);
  }

  static bool isAuthenticated() {
    return _authMethod != AuthMethod.NONE;
  }

  static Container getProfileViewContainer(BuildContext context) {
    if (!AppUser.isAuthenticated())
      return null;
    else
      return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(40.0),
                topRight: const Radius.circular(40.0),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                Container(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('${AppUser.profileImageUrl}'),
                  ),
                ),
                Container(
                  child: Text(
                    '${AppUser.displayName}',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                Container(
                  child: Text('${AppUser.email}'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  decoration: BoxDecoration(border: Border.all()),
                  child: RaisedButton(
                    color: Colors.white,
                    child: Text("SIGN OUT"),
                    onPressed: () async {
                      await AppUser.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyStatefulWidget()),
                      );
                    },
                  ),
                ),
              ])
            ],
          ));
  }

  // endregion

  // region 3rd-party auth methods
  static Future<Tuple2<User, Map>> _kakaoAuth() async {
    Map<String, dynamic> tokens = {};

    AccessToken token = await AccessTokenStore.instance.fromStore();

    if (token.accessToken == null) {
      // token locally unavailable
      try {
        String authCode; // get auth code
        if (await isKakaoTalkInstalled())
          authCode = await AuthCodeClient.instance.requestWithTalk(); // app
        else
          authCode = await AuthCodeClient.instance.request(); // web

        AccessTokenResponse token = await AuthApi.instance.issueAccessToken(authCode); // get token
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
    }
    return null;
  }

  static Future<Tuple2<GoogleSignInAccount, Map>> _googleAuth() async {
    Map<String, dynamic> tokens = {};

    GoogleSignInAccount account = await AppUser.googleSignIn.signIn();
    if (account != null) {
      GoogleSignInAuthentication auth = await account.authentication;

      tokens.putIfAbsent("idToken", () => auth.idToken);
      tokens.putIfAbsent("accessToken", () => auth.accessToken);
      tokens.putIfAbsent("serverAuthCode", () => auth.serverAuthCode);
      return Tuple2(account, tokens);
    }

    return null;
  }

  static Future<Tuple2<Map, Map>> _facebookAuth() async {
    Map<String, dynamic> tokens = {};

    facebookLogin = FacebookLogin();
    FacebookLoginResult facebookLoginResult = await facebookLogin.logIn(['email']);

    if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
      final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,picture,email&access_token=${facebookLoginResult.accessToken.token}');

      tokens.putIfAbsent("accessToken", () => facebookLoginResult.accessToken.token);
      tokens.putIfAbsent("userId", () => facebookLoginResult.accessToken.userId);
      tokens.putIfAbsent("declinedPermissions", () => facebookLoginResult.accessToken.declinedPermissions.toString());
      tokens.putIfAbsent("expires", () => facebookLoginResult.accessToken.expires.millisecondsSinceEpoch);
      tokens.putIfAbsent("permissions", () => facebookLoginResult.accessToken.permissions.toString());

      return Tuple2(JSON.jsonDecode(graphResponse.body), tokens);
    }

    return null;
  }

  static Future<Object> _phoneAuth() async {
    // todo implement phone auth
    return null;
  }

  static Future<Object> _appleAuth() async {
    // todo implement phone auth
    return null;
  }
// endregion
}

enum AuthMethod { NONE, PHONE, KAKAO, GOOGLE, FACEBOOK, APPLE }
