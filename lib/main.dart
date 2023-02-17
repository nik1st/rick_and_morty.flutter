import 'package:flutter/material.dart';
import 'home/home.dart';

void main() => runApp(MaterialApp(
    title: "App",
    home: const Home(),
    theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity)));
