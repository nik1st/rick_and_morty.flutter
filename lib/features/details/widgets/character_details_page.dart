import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/repository/repository.dart';
import 'package:rick_and_morty/features/details/details.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage(this._id, {super.key});

  final int _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: BlocProvider(
        create: (_) =>
            CharacterDetailsCubit(Repository())..fetchCharDetails(_id),
        child: const CharacterDetailsList(),
      ),
    );
  }
}
