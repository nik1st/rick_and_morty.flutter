import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:rick_and_morty/repository/repository.dart';

part 'characters_event.dart';
part 'characters_state.dart';

const throttleDuration = Duration(milliseconds: 1000);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc({required this.repository}) : super(const CharactersState()) {
    on<CharactersFetched>(
      _onCharactersFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  int _page = 0;
  final Repository repository;

  Future<void> _onCharactersFetched(
      CharactersFetched event, Emitter<CharactersState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == CharactersStatus.initial) {
        _page = 0;
        final response = await repository.fetchCharacters(_page);
        return emit(state.copyWith(
          status: CharactersStatus.success,
          chars: response.results,
          hasReachedMax: false,
        ));
      }
      _page++;
      final response = await repository.fetchCharacters(_page);
      emit(response.results.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: CharactersStatus.success,
              chars: List.of(state.chars)..addAll(response.results),
              hasReachedMax: false,
            ));
    } catch (_) {
      emit(state.copyWith(status: CharactersStatus.failure));
    }
  }
}
