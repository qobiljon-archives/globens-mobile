import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/auth.dart';

class AuthenticateWidget extends StatelessWidget {
  void onPhoneAuthClick() {}

  void onKakaoAuthClick() async {
    try {
      // todo do by thread
      print('here');
      String authCode = await AuthCodeClient.instance.request();
      print(authCode);
    } on KakaoAuthException catch (e) {
      // some error happened during the course of user login... deal with it.
    } on KakaoClientException catch (e) {
      //
    } catch (e) {
      //
    }
  }

  void onGoogleAuthClick() {}

  void onFacebookAuthClick() {}

  @override
  Widget build(BuildContext context) {
    KakaoContext.clientId = "25bf75f9c559f5f1f78da11571eb818a";
    // KakaoContext.javascriptClientId = "678dcd86c1cfc8f0c83d6df0d96d2366" // not yet supported

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            child: Text(
              "User authentication",
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.only(top: 100.0),
            decoration: BoxDecoration(border: Border.all()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                  decoration: BoxDecoration(border: Border.all()),
                  child: RaisedButton(
                    color: Colors.white,
                    elevation: 0.0,
                    child: Text(
                      "Phone number",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: onPhoneAuthClick,
                  ),
                ),
                // todo https://github.com/kakao/kakao_flutter_sdk
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
                    onPressed: onGoogleAuthClick,
                  ),
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
                    onPressed: onFacebookAuthClick,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
