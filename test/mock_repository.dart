import 'package:rick_and_morty/repository/repository.dart';

const mockChars = <Character>[
  Character(id: 1, name: 'James', race: 'human', gender: 'male', image: ''),
  Character(id: 2, name: 'John', race: 'human', gender: 'male', image: ''),
  Character(id: 3, name: 'Nik', race: '?', gender: 'male', image: ''),
  Character(id: 4, name: 'Samuel', race: 'human', gender: 'male', image: ''),
  Character(id: 5, name: 'Jordan', race: 'human', gender: 'male', image: ''),
];

const mockDetails = CharacterDetails(
    id: 0,
    name: 'James',
    race: 'human',
    gender: 'male',
    image: '',
    status: 'alive',
    location: Location(name: 'Russia', url: ''),
    episodes: ['1', '2', '3']);

class MockRepository implements Repository {
  @override
  Future<CharacterDetails> fetchCharacterDetailsWith(int id) async {
    await Future.delayed(const Duration(seconds: 1));

    if (id == -1) {
      throw Exception('Failed to load character');
    }

    return mockDetails;
  }

  @override
  Future<CharactersResponse> fetchCharacters(int page) async {
    Future.delayed(const Duration(seconds: 1));

    if (page == -1) {
      throw Exception('Failed to load characters list');
    }

    if (page == 2) {
      return const CharactersResponse(results: []);
    }

    return const CharactersResponse(results: mockChars);
  }
}
