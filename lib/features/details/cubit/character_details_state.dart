part of 'character_details_cubit.dart';

enum CharacterDetailsStatus { initial, loading, success, failure }

class CharacterDetailsState extends Equatable {
  const CharacterDetailsState(
      {this.status = CharacterDetailsStatus.initial, this.details});

  final CharacterDetailsStatus status;
  final CharacterDetails? details;

  CharacterDetailsState copyWith({
    CharacterDetailsStatus? status,
    CharacterDetails? details,
    bool? hasReachedMax,
  }) {
    return CharacterDetailsState(
      status: status ?? this.status,
      details: details ?? this.details,
    );
  }

  @override
  List<Object> get props => [status];
}

class CharacterDetailsInitial extends CharacterDetailsState {}
