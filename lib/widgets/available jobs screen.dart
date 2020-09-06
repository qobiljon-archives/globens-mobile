import 'package:flutter/material.dart';

class AvailableJobs extends StatefulWidget {
  @override
  _AvailableJobsState createState() => _AvailableJobsState();
}

class _AvailableJobsState extends State<AvailableJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Available Jobs"),
      ),
    );
  }
}
