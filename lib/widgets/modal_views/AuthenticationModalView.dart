import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';

class AuthenticationModalView {
  static Widget getModalView(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 100.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
        Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              "SIGN IN WITH",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.blue),
            )),
        Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
          child: RaisedButton.icon(
            label: Text(
              "KakaoTalk",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            icon: Image.asset(
              'assets/kakaotalk.png',
              width: 25,
              fit: BoxFit.cover,
            ),
            elevation: 0.0,
            onPressed: () => _onKakaoPressed(context),
          ),
        ),
        Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
          child: RaisedButton.icon(
              label: Text(
                "Google",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              icon: Image.asset(
                'assets/google.png',
                width: 25,
                fit: BoxFit.cover,
              ),
              elevation: 0.0,
              onPressed: () => _onGooglePressed(context)),
        ),
        Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.all(10.0),
          child: RaisedButton.icon(
              label: Text(
                "Facebook",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              icon: Image.asset(
                'assets/facebook.png',
                width: 25,
                fit: BoxFit.cover,
              ),
              elevation: 0.0,
              onPressed: () => _onFacebookPressed(context)),
        ),
      ]),
    );
  }

  static void _onKakaoPressed(BuildContext context) async {
    if (await AppUser.signIn(AuthMethod.KAKAO))
      await toast("Signed in with Google.");
    else
      await toast("Failed to login with KakaoTalk.\nPlease try again later!");

    Navigator.of(context).pop();
  }

  static void _onGooglePressed(BuildContext context) async {
    if (await AppUser.signIn(AuthMethod.GOOGLE))
      await toast("Signed in with Google.");
    else
      await toast("Failed to login with Google.\nPlease try again later!");

    Navigator.of(context).pop();
  }

  static void _onFacebookPressed(BuildContext context) async {
    if (await AppUser.signIn(AuthMethod.FACEBOOK))
      await toast("Signed in with Google.");
    else
      await toast("Failed to login with Facebook.\nPlease try again later!");

    Navigator.of(context).pop();
  }
}
