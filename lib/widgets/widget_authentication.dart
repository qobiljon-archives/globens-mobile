import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class AuthenticateWidget extends StatefulWidget {
  @override
  AuthenticateWidgetState createState() => AuthenticateWidgetState();
}

class AuthenticateWidgetState extends State<AuthenticateWidget> {
  // region Override
  @override
  Widget build(BuildContext context) {
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
                      "Phone",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: Colors.white,
                    elevation: 0.0,
                    onPressed: onPhoneAuthClick,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                  decoration: BoxDecoration(border: Border.all()),
                  child: RaisedButton(
                    child: Text(
                      "Kakao",
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
                      onPressed: onGoogleAuthClick),
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
                      onPressed: onFacebookAuthClick),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(border: Border.all()),
                  child: RaisedButton(
                      child: Text(
                        "Apple",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      color: Colors.white,
                      elevation: 0.0,
                      onPressed: onAppleAuthClick),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  // endregionK

  // region Event handlers
  void onPhoneAuthClick() async {
    if (await AppUser.signIn(AuthMethod.PHONE))
      Navigator.pop(context);
    else
      Fluttertoast.showToast(msg: "Failed to login with phone number.\nPlease try again later!", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
  }

  void onKakaoAuthClick() async {
    if (await AppUser.signIn(AuthMethod.KAKAO))
      Navigator.pop(context);
    else
      Fluttertoast.showToast(msg: "Failed to login with Kakao.\nPlease try again later!", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
  }

  void onGoogleAuthClick() async {
    if (await AppUser.signIn(AuthMethod.GOOGLE))
      Navigator.pop(context);
    else
      Fluttertoast.showToast(msg: "Failed to login with Google.\nPlease try again later!", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
  }

  void onFacebookAuthClick() async {
    if (await AppUser.signIn(AuthMethod.FACEBOOK))
      Navigator.pop(context);
    else
      Fluttertoast.showToast(msg: "Failed to login with Facebook.\nPlease try again later!", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
  }

  void onAppleAuthClick() async {
    if (await AppUser.signIn(AuthMethod.APPLE))
      Navigator.pop(context);
    else
      Fluttertoast.showToast(msg: "Failed to login with Apple.\nPlease try again later!", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
  }
// endregion
}
