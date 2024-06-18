import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnsButton extends StatelessWidget {
  const AnsButton({super.key, required this.answerText, required this.onTap});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          backgroundColor: const Color.fromARGB(255, 45, 9, 82),
          foregroundColor: Colors.white),
      onPressed: onTap,
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: GoogleFonts.josefinSans(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
