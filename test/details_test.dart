import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/features/details/details.dart';
import 'package:bloc_test/bloc_test.dart';
import 'repository_mock.dart';

void main() {
  group('Details Cubit Test: ', () {
    late CharacterDetailsCubit cubit;
    MockRepository mockRepository;

    setUp(() {
      EquatableConfig.stringify = true;
      mockRepository = MockRepository();
      cubit = CharacterDetailsCubit(mockRepository);
    });

    blocTest<CharacterDetailsCubit, CharacterDetailsState>(
      'emits success CharacterDetailsStatus for successful character details load',
      build: () => cubit,
      act: (bloc) => cubit.fetchCharDetails(0),
      expect: () => [
        const CharacterDetailsState(status: CharacterDetailsStatus.loading),
        const CharacterDetailsState(
            status: CharacterDetailsStatus.success, details: mockDetails)
      ],
    );

    tearDown(() => cubit.close());
  });
}
