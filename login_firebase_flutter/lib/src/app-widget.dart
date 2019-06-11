import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'app-bloc.dart';


import 'login/login-widget.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocProvider<AppBloc>(
      bloc: AppBloc(),
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginWidget()),
    );
  }
}
