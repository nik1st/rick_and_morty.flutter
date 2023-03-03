import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/models/models.dart';
import 'package:rick_and_morty/features/details/details.dart';

class CharacterDetailsList extends StatelessWidget {
  const CharacterDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterDetailsCubit, CharacterDetailsState>(
        builder: (context, state) {
      if (state.status == CharacterDetailsStatus.loading) {
        return const Center(child: CircularProgressIndicator());
      }

      final details = state.details as CharacterDetails;
      return ListView(
        children: [
          Image.network(
            details.image,
            scale: 0.7,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(details.name,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          CharacterProperty(details.race, Icons.man),
          CharacterProperty(details.gender, Icons.transgender_sharp),
          CharacterProperty(details.status, Icons.favorite),
          CharacterProperty(
              'Found in ${details.episodes.length} ${details.episodes.length == 1 ? 'episode' : 'episodes'}',
              Icons.movie),
          CharacterProperty(
              'Last found at ${details.location.name}', Icons.push_pin_sharp),
        ],
      );
    });
  }
}
