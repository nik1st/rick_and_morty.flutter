import 'package:equatable/equatable.dart';

class Character extends Equatable {
  const Character(
      {required this.id,
      required this.name,
      required this.race,
      required this.gender,
      required this.image});

  final int id;
  final String name;
  final String race;
  final String gender;
  final String image;

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        id: json['id'],
        name: json['name'],
        race: json['species'],
        gender: json['gender'],
        image: json['image']);
  }

  @override
  List<Object> get props => [id, name, race, gender, image];
}
