import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoiceName extends StatelessWidget {
  const ChoiceName({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: GoogleFonts.montserrat(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(45, 158, 158, 158),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'VIEW AS LIST',
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
        )
      ],
    );
  }
}
