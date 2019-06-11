import 'package:flutter/material.dart';
import 'package:login_firebase_flutter/src/login/login-widget.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _logout() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Inicial"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: _logout,
        child: Icon(Icons.exit_to_app),
      ),
    );
  }
}
