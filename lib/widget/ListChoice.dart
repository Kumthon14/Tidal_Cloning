
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class ListChoice extends StatelessWidget {
  const ListChoice({
    super.key,
  });

  final

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.calendar_today_rounded,color: const Color.fromARGB(255, 120, 255, 223),),
      title: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text('New',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),),
      ),
      trailing: Icon(IconlyLight.arrow_right_2),
    );
  }
}
