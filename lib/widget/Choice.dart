import 'package:flutter/material.dart';

class ChoiceList extends StatelessWidget {
  const ChoiceList({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color.fromARGB(45, 158, 158, 158),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Nationale',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 196, 196, 196),
          ),
        ),
      ),
    );
  }
}
