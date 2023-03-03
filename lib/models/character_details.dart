import 'package:rick_and_morty/models/models.dart';

class CharacterDetails extends Character {
  const CharacterDetails(
      {required super.id,
      required super.name,
      required super.race,
      required super.gender,
      required super.image,
      required this.status,
      required this.location,
      required this.episodes});

  final String status;
  final Location location;
  final List<String> episodes;

  factory CharacterDetails.fromJson(Map<String, dynamic> json) {
    return CharacterDetails(
      id: json['id'],
      name: json['name'],
      race: json['species'],
      gender: json['gender'],
      image: json['image'],
      status: json['status'],
      location: Location.fromJson(json['location']),
      episodes: List<String>.from(json['episode']),
    );
  }
}

class Location {
  const Location({required this.name, required this.url});

  final String name;
  final String url;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(name: json['name'], url: json['url']);
  }
}
