import 'package:dnd/widgets/skill_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Content extends StatelessWidget {
  const Content({super.key, required this.title, required this.skills});
  final String title;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        Text(
          title,
          style: GoogleFonts.albertSans(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: skills.length,
          itemBuilder: (context, index) => SkillTile(title: skills[index]),
        )
      ],
    );
  }
}
