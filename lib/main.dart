import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:krepm_new/startView.dart';
import 'homeView.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(KrepMApp());

class KrepMApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'КРЕП.М',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color.fromRGBO(67, 38, 25, 1)),
      home: StartView(),
    );
  }
}
