part of 'characters_bloc.dart';

enum CharactersStatus { initial, success, failure }

class CharactersState extends Equatable {
  const CharactersState({
    this.status = CharactersStatus.initial,
    this.chars = const <Character>[],
    this.hasReachedMax = false,
  });

  final CharactersStatus status;
  final List<Character> chars;
  final bool hasReachedMax;

  CharactersState copyWith({
    CharactersStatus? status,
    List<Character>? chars,
    bool? hasReachedMax,
  }) {
    return CharactersState(
      status: status ?? this.status,
      chars: chars ?? this.chars,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, chars, hasReachedMax];
}
