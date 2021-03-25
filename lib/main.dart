import 'package:flutter/material.dart';
import 'package:gklabss/screens/addPhoto.dart';
import 'package:gklabss/screens/authScreen.dart';
import 'package:gklabss/screens/importImage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(),
      routes: {
        ImagesDisplay.routeName: (ctx) => ImagesDisplay(),
        AddPhoto.routeName: (ctx) => AddPhoto(),
      },
    );
  }
}
