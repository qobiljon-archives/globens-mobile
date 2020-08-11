import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globens_flutter_client/widgets/widget_main/widget_main.dart';
import '../../widgets/widget_authentication.dart';

class LogOut extends StatelessWidget {
  final username;
  final imgUrl;

  LogOut(this.username, this.imgUrl);

  AuthenticateWidgetState auth = AuthenticateWidgetState();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border.all()),
        child: Container(
            decoration: BoxDecoration(border: Border.all()),
            width: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      //alignment: Alignment.centerLeft,
                      child: FlatButton(
                          child: Text(
                            "cancel",
                            style: TextStyle(color: Colors.lightBlueAccent),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Text("Personal Page",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ))),
                  ],
                ),
                Column(children: [
                  //user image
                  Container(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('$imgUrl'),
                    ),
                  ),
                  // user name
                  Container(
                    child: Text(
                      '$username',
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                  //logout
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 50,
                    decoration: BoxDecoration(border: Border.all()),
                    child: RaisedButton(
                      color: Colors.white,
                      child: Text("LOGOUT"),
                      onPressed: () {
                        auth.googleSignOut();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ])
              ],
            )));
  }
}
