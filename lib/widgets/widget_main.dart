import 'package:globens_flutter_client/widgets/widget_authentication.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // Application root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Globens'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        // todo do the main page (i.e., products, categories, ads, search, etc.)
        child: RaisedButton(
          child: Text("Open authentication page"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AuthenticateWidget()));
          },
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
