import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/repository/repository.dart';

part 'character_details_state.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  CharacterDetailsCubit(this._repository) : super(CharacterDetailsInitial());

  final Repository _repository;

  void fetchCharDetails(int id) async {
    emit(state.copyWith(status: CharacterDetailsStatus.loading));
    final details = await _repository.fetchCharacterDetailsWith(id);
    emit(state.copyWith(
        status: CharacterDetailsStatus.success, details: details));
  }
}
