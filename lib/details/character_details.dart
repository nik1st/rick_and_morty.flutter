import 'package:flutter/material.dart';
import 'package:rick_and_morty/details/view/property_card.dart';
import 'package:rick_and_morty/model/service.dart';
import '../model/character.dart';

class Details extends StatefulWidget {
  final int id;

  const Details(this.id, {super.key});

  @override
  State<StatefulWidget> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final Service service = Service();
  late Future<CharacterDetails> _charDetails;

  @override
  void initState() {
    super.initState();
    _charDetails = service.fetchCharacterDetailsWith(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _charDetails,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Text('Error!');
            }
            if (!snapshot.hasData) {
              return const Text('No details for this character');
            }

            final charDetails = snapshot.data as CharacterDetails;

            return ListView(
              children: [
                Image.network(
                  charDetails.image,
                  scale: 0.7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(charDetails.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                CharacterProperty(charDetails.race, Icons.man),
                CharacterProperty(charDetails.gender, Icons.transgender_sharp),
                CharacterProperty(charDetails.status, Icons.favorite),
                CharacterProperty(
                    'Found in ${charDetails.episodes.length} ${charDetails.episodes.length == 1 ? 'episode' : 'episodes'}',
                    Icons.movie),
                CharacterProperty('Last found at ${charDetails.location.name}',
                    Icons.push_pin_sharp),
              ],
            );
          },
        ),
      ),
    );
  }
}
