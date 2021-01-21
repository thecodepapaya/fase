import 'package:fase/location_permission.dart';
import 'package:fase/startup_check.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    LocationPermission(context).requestPermisson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("in.ac.iiitvadodara.fase"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          StartupCheck().isRooted();
        },
        child: Icon(Icons.wifi),
      ),
    );
  }
}
