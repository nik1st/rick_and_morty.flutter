import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';

class CharacterCell extends StatelessWidget {
  final Character char;
  final void Function(int) onTap;

  const CharacterCell(this.char, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(char.image)),
              title: Text(char.name),
              subtitle: Text('${char.race}\n${char.gender}'),
              onTap: () => onTap(char.id)),
        ));
  }
}
