import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends Statelesswidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Http',
      theme: ThemeData(appBarTheme: AppBarTheme(elevation: 0)),
      home: Home(),
    );
  }
}