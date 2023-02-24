import 'package:flutter/material.dart';
import 'package:rick_and_morty/repository/models/models.dart';

class CharacterListItem extends StatelessWidget {
  const CharacterListItem(this.char, this.onTap, {super.key});

  final Character char;
  final void Function(int) onTap;

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
