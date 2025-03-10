import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ListChoice extends StatelessWidget {
  const ListChoice({
    super.key,
    required this.colors,
    required this.text,
    required this.icons,
  });

  final Color colors;
  final String text;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icons,
        color: colors,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          text,
          style:
              TextStyle(fontFamily: 'Nationale', fontWeight: FontWeight.w600),
        ),
      ),
      trailing: Icon(IconlyLight.arrow_right_2),
    );
  }
}
