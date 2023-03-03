import 'package:rick_and_morty/models/models.dart';

class CharactersResponse {
  const CharactersResponse({
    required this.results,
  });

  final List<Character> results;

  factory CharactersResponse.fromJson(Map<String, dynamic> json) {
    return CharactersResponse(
        results: List<dynamic>.from(json['results'])
            .map((e) => Character.fromJson(e))
            .toList());
  }
}
