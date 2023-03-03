import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/features/characters/characters.dart';
import 'package:bloc_test/bloc_test.dart';
import 'mock_repository.dart';

void main() {
  group('Characters Bloc Test: ', () {
    late CharactersBloc bloc;
    MockRepository mockRepository;

    setUp(() {
      EquatableConfig.stringify = true;
      mockRepository = MockRepository();
      bloc = CharactersBloc(repository: mockRepository);
    });

    blocTest<CharactersBloc, CharactersState>(
      'emits empty CharactersState for empty characters load',
      build: () => bloc,
      act: (bloc) => bloc.add(const CharactersFetched(2)),
      expect: () => [
        const CharactersState(
          status: CharactersStatus.success,
          chars: [],
          hasReachedMax: false,
        )
      ],
    );

    blocTest<CharactersBloc, CharactersState>(
      'emits failure CharactersState for error in characters load',
      build: () => bloc,
      act: (bloc) => bloc.add(const CharactersFetched(-1)),
      expect: () => [
        const CharactersState(
          status: CharactersStatus.failure,
        )
      ],
    );

    blocTest<CharactersBloc, CharactersState>(
      'emits success CharactersState for successful characters load',
      build: () => bloc,
      act: (bloc) => bloc.add(const CharactersFetched(0)),
      expect: () => [
        const CharactersState(
          status: CharactersStatus.success,
          chars: mockChars,
          hasReachedMax: false,
        )
      ],
    );

    tearDown(() => bloc.close());
  });
}
