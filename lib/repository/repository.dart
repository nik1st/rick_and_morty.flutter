import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rick_and_morty/repository/models/models.dart';

export 'models/models.dart';

class Repository {
  final _baseUrl = 'https://rickandmortyapi.com/api';

  Future<CharactersResponse> fetchCharacters(int page) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/character?page=$page'));
    if (response.statusCode == 200) {
      return CharactersResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load characters list');
    }
  }

  Future<CharacterDetails> fetchCharacterDetailsWith(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/character/$id'));
    if (response.statusCode == 200) {
      return CharacterDetails.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load character');
    }
  }
}
