part of 'characters_bloc.dart';

abstract class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

class CharactersFetched extends CharactersEvent {
  const CharactersFetched(this.pageId);

  final int pageId;

  @override
  List<Object> get props => [pageId];
}
