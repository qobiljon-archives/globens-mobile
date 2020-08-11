import 'package:globens_flutter_client/widgets/widget_main/widget_logout.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:kakao_flutter_sdk/user.dart';
import 'package:flutter/material.dart';
import '../widgets/widget_main/widget_main.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticateWidget extends StatefulWidget {
  @override
  AuthenticateWidgetState createState() => AuthenticateWidgetState();
}

class AuthenticateWidgetState extends State<AuthenticateWidget> {
  String userName;
  String photoUrl;

  GoogleSignIn signIn = GoogleSignIn(scopes: [
    'https://www.googleapis.com/auth/userinfo.email',
    'https://www.googleapis.com/auth/userinfo.profile',
    'openid'
  ]);

  void googleSignOut() {
    signIn.signOut();
  }

  void onKakaoAuthClick() async {
    // check if we have previous token available
    AccessToken token = await AccessTokenStore.instance.fromStore();
    if (token.refreshToken == null) {
      try {
        // check if kakaotalk app is installed
        String authCode;
        if (await isKakaoTalkInstalled())
          authCode = await AuthCodeClient.instance.requestWithTalk();
        else
          authCode = await AuthCodeClient.instance.request();
        print('auth code received: $authCode');

        AccessTokenResponse token =
            await AuthApi.instance.issueAccessToken(authCode);
        AccessTokenStore.instance.toStore(token);
        print('access token received: $token');

        try {
          User user = await UserApi.instance.me();
          print('kakao nickname: ${user.kakaoAccount.profile.nickname}');
          print('kakao email: ${user.kakaoAccount.email}');
          // get  user kakaotalk info

        } on KakaoAuthException catch (e) {
          print(e);
        } catch (e) {
          print(e);
        }
      } on KakaoAuthException catch (e) {
        print(e);
      } on KakaoClientException catch (e) {
        print(e);
      } catch (e) {
        print(e);
      }
    }
  }

  void onGoogleAuthClick() async {
    try {
      GoogleSignInAccount account = await signIn.signIn();
      print("Starting to auth...");
      print('openId: ${account.id}');
      print('email: ${account.email}');
      print('email: ${account.displayName}');
      print('photo: ${account.photoUrl}');
      print("Closing auth...");

      // get  user google account info

      if (signIn.signIn() != null) {
        setState(() {
          userName = account.displayName;
          photoUrl = account.photoUrl;
        });
        addUserName(userName);
        addImgUrl(photoUrl);

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage()));
      }
    } catch (e) {
      print(e);
    }
  }

  addUserName(String name) async {
    SharedPreferences username = await SharedPreferences.getInstance();
    username.setString("name", name);
  }

  addImgUrl(String imgurl) async {
    SharedPreferences imgUrl = await SharedPreferences.getInstance();
    imgUrl.setString('imgUrl', imgurl);
  }

  Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString("name");
    return name;
  }

  Future<String> getimgUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String img = prefs.getString("imgUrl");
    return img;
  }

  void onFacebookAuthClick() {
    // facebook oauth redirect uri : https://globens-uz.firebaseapp.com/__/auth/handler
  }

  @override
  Widget build(BuildContext context) {
    KakaoContext.clientId = "25bf75f9c559f5f1f78da11571eb818a";
    // KakaoContext.javascriptClientId = "678dcd86c1cfc8f0c83d6df0d96d2366" // not yet supported

    return Scaffold(
      appBar: AppBar(
        title: const Text('User authentication'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(border: Border.all()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // todo do ios part when publishing on
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                  decoration: BoxDecoration(border: Border.all()),
                  child: RaisedButton(
                    child: Text(
                      "Kakaotalk",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: Colors.white,
                    elevation: 0.0,
                    onPressed: onKakaoAuthClick,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                  decoration: BoxDecoration(border: Border.all()),
                  child: RaisedButton(
                      child: Text(
                        "Google",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      color: Colors.white,
                      elevation: 0.0,
                      onPressed: () {
                        onGoogleAuthClick();
                      }),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(border: Border.all()),
                  child: RaisedButton(
                      child: Text(
                        "Facebook",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      color: Colors.white,
                      elevation: 0.0,
                      onPressed: () {
                        getUserName().then((value) => print(value));
                        getimgUrl().then((value) => print(value));
                      }),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
