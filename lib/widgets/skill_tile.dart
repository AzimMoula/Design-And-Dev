import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillTile extends StatelessWidget {
  const SkillTile({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(height: 20, width: 20, 'assets/triangle.png'),
        const SizedBox(width: 15),
        Text(
          title,
          style: GoogleFonts.albertSans(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
