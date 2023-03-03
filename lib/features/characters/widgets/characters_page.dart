import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/characters/characters.dart';
import 'package:rick_and_morty/repository/repository.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocProvider(
        create: (_) => CharactersBloc(repository: RepositoryImpl())
          ..add(CharactersFetched()),
        child: const CharactersList(),
      ),
    );
  }
}
