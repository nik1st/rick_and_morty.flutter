import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/characters/characters.dart';
import 'package:rick_and_morty/simple_bloc_observer.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  runApp(MaterialApp(
      title: "App",
      home: const CharactersPage(),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity)));
}
