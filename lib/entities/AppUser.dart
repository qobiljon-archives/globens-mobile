import 'package:globens_flutter_client/entities/GlobensUser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';
import 'dart:convert' as JSON;
import 'dart:io';

enum AuthMethod { APPLE, GOOGLE }

class AppUser {
  // region Variables
  static AppUser _singleton;
  static GoogleSignIn googleSignIn;
  static SharedPreferences userPrefs;

  static AuthMethod _authMethod;
  static int _id = -1;
  static String _email;
  static String _displayName;
  static String _profileImageUrl;
  static String _sessionKey;
  static bool _initialized = false;
  static String _countryCode = "KOR";

  static AuthMethod get authMethod => _authMethod;

  static int get id => _id;

  static bool get initialized => _initialized;

  static String get email => _email;

  static String get displayName => _displayName;

  static String get profileImageUrl => _profileImageUrl;

  static String get sessionKey => _sessionKey;

  static String get countryCode => _countryCode;

  // endregion

  // region Constructor & init function
  factory AppUser() {
    return _singleton;
  }

  AppUser._internalConstructor();

  static Future<void> init() async {
    AppUser._singleton = AppUser._internalConstructor();
    AppUser.userPrefs = await SharedPreferences.getInstance();
    if (AppUser.userPrefs.containsKey("id")) {
      AppUser.setProfileInfo(
        authMethod: AuthMethod.values.firstWhere((element) => element.toString() == AppUser.userPrefs.getString("authMethod")),
        id: AppUser.userPrefs.getInt("id"),
        email: AppUser.userPrefs.getString("email"),
        displayName: AppUser.userPrefs.getString("displayName"),
        profileImageUrl: AppUser.userPrefs.getString("profileImageUrl"),
        sessionKey: AppUser.userPrefs.getString("sessionKey"),
        countryCode: AppUser.userPrefs.getString("countryCode"),
      );
    }

    final languageCode = AppUser.userPrefs.getInt("language");
    Locale.languageCode = languageCode != null ? languageCode : Language.ENGLISH;
    AppUser.googleSignIn = GoogleSignIn(scopes: ['https://www.googleapis.com/auth/userinfo.email', 'https://www.googleapis.com/auth/userinfo.profile', 'openid']);
    AppUser._initialized = true;
  }

  // endregion

  // region Setters & getters
  static void setProfileInfo({AuthMethod authMethod, int id, String email, String displayName, String profileImageUrl, String sessionKey, String countryCode}) {
    if (authMethod != null) AppUser._authMethod = authMethod;
    if (id != null) AppUser._id = id;
    if (email != null) AppUser._email = email;
    if (displayName != null) AppUser._displayName = displayName;
    if (profileImageUrl != null) AppUser._profileImageUrl = profileImageUrl;
    if (sessionKey != null) AppUser._sessionKey = sessionKey;
    if (countryCode != null) AppUser._countryCode = countryCode;
  }

  static void clearProfileInfo() {
    AppUser._authMethod = null;
    AppUser._id = -1;
    AppUser._email = null;
    AppUser._displayName = null;
    AppUser._profileImageUrl = null;
    AppUser._countryCode = null;
  }

  // endregion

  // region Utility functions
  static Future<bool> signIn(AuthMethod authMethod) async {
    if (authMethod == AuthMethod.APPLE) {
      var res = await _appleAuth();
      print("email = ${res.email}");
      print("givenName = ${res.givenName}");
      print("familyName = ${res.familyName}");
      print("authorizationCode = ${res.authorizationCode}");
      print("identityToken = ${res.identityToken}");
      print("state = ${res.state}");
      print("userIdentifier = ${res.userIdentifier}");
      return false;
    } else if (authMethod == AuthMethod.GOOGLE) {
      if (await AppUser.googleSignIn.isSignedIn()) await AppUser.googleSignIn.signOut();
      var googleRes = await AppUser._googleAuth();
      if (googleRes != null) {
        GoogleSignInAccount user = googleRes.item1;
        Map tokens = googleRes.item2;
        Tuple3<bool, int, String> grpcRes = await gprcAuthenticateUser(JSON.jsonEncode(tokens));

        bool success = grpcRes.item1;
        int userId = grpcRes.item2;
        String sessionKey = grpcRes.item3;
        if (success) {
          AppUser.setProfileInfo(
            id: userId,
            email: user.email,
            displayName: user.displayName,
            profileImageUrl: user.photoUrl,
            sessionKey: sessionKey,
            countryCode: "KOR",
          );
          AppUser.updateUserPrefsData();
          return true;
        }
      }
    }
    return false;
  }

  static Future<void> signOut() async {
    switch (_authMethod) {
      case AuthMethod.APPLE:
        // todo sign out from apple
        break;
      case AuthMethod.GOOGLE:
        await googleSignIn.signOut();
        break;
    }
    await userPrefs.clear();
    AppUser.clearProfileInfo();
  }

  static void updateUserPrefsData() {
    if (AppUser._authMethod != null) {
      userPrefs.setString("authMethod", AppUser._authMethod.toString());
      userPrefs.setInt("id", AppUser._id);
      userPrefs.setString("email", AppUser._email);
      userPrefs.setString("displayName", AppUser._displayName);
      userPrefs.setString("profileImageUrl", AppUser._profileImageUrl);
      userPrefs.setString("sessionKey", AppUser._sessionKey);
      userPrefs.setString("countryCode", AppUser._countryCode);
    } else
      clearProfileInfo();
  }

  static bool isAuthenticated() {
    return _id > -1;
  }

  static Future<GlobensUser> getMyGlobensUser() async {
    http.Response response = await http.get(_profileImageUrl);
    if (response.statusCode == HttpStatus.ok) return GlobensUser.create(_id, _email, _displayName, _profileImageUrl, response.bodyBytes, _countryCode);
    return null;
  }

  // endregion

  static Future<AuthorizationCredentialAppleID> _appleAuth() async {
    return await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
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
}
