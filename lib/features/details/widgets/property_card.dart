import 'package:flutter/material.dart';

class CharacterProperty extends StatelessWidget {
  final String value;
  final IconData? icon;

  const CharacterProperty(this.value, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(12),
      child: ListTile(
          textColor: Colors.white,
          title: Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          leading: Icon(
            icon,
            color: Colors.white,
            size: 24.0,
          )),
    );
  }
}
