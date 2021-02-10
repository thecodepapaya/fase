import 'package:fase/utils/location_permission.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        onPressed: () async {
          http.Response response = await http.get(
              'https://fase.centralindia.cloudapp.azure.com/course/?format=json');
          print("Response: ${response.body}");
        },
        child: Icon(Icons.wifi),
      ),
    );
  }
}
