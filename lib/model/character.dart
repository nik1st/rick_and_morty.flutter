class Character {
  final int id;
  final String name;
  final String race;
  final String gender;
  final String image;

  const Character(
      {required this.id,
      required this.name,
      required this.race,
      required this.gender,
      required this.image});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        id: json['id'],
        name: json['name'],
        race: json['species'],
        gender: json['gender'],
        image: json['image']);
  }
}

class CharactersResponse {
  final int pagesCount;
  final List<Character> results;

  const CharactersResponse({
    required this.pagesCount,
    required this.results,
  });

  factory CharactersResponse.fromJson(Map<String, dynamic> json) {
    return CharactersResponse(
        pagesCount: json['info']['pages'],
        results: List<dynamic>.from(json['results'])
            .map((e) => Character.fromJson(e))
            .toList());
  }
}

class CharacterDetails extends Character {
  final String status;
  final Location location;
  final List<String> episodes;

  CharacterDetails(
      {required super.id,
      required super.name,
      required super.race,
      required super.gender,
      required super.image,
      required this.status,
      required this.location,
      required this.episodes});

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
  final String name;
  final String url;

  const Location({required this.name, required this.url});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(name: json['name'], url: json['url']);
  }
}
