import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';


class AuthenticationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Sign in with",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: RaisedButton.icon(
              label: Text(
                "Kakao",
                style: TextStyle(fontSize: 20.0),
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
                  style: TextStyle(fontSize: 20.0),
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
                  style: TextStyle(fontSize: 20.0),
                ),
                icon: Image.asset(
                  'assets/facebook.png',
                  width: 25,
                  fit: BoxFit.cover,
                ),
                elevation: 0.0,
                onPressed: () => _onFacebookPressed(context)),
          ),

        ]));
  }

  void _onKakaoPressed(BuildContext context) async {
    if (await AppUser.signIn(AuthMethod.KAKAO))
      Navigator.of(context).popUntil(ModalRoute.withName('root'));
    else
      Fluttertoast.showToast(msg: "Failed to login with Kakao.\nPlease try again later!", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
  }

  void _onGooglePressed(BuildContext context) async {
    if (await AppUser.signIn(AuthMethod.GOOGLE))
      Navigator.of(context).popUntil(ModalRoute.withName('root'));
    else
      Fluttertoast.showToast(msg: "Failed to login with Google.\nPlease try again later!", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
  }

  void _onFacebookPressed(BuildContext context) async {
    if (await AppUser.signIn(AuthMethod.FACEBOOK))
      Navigator.of(context).popUntil(ModalRoute.withName('root'));
    else
      Fluttertoast.showToast(msg: "Failed to login with Facebook.\nPlease try again later!", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
  }
}
