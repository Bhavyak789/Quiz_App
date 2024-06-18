import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:quiz_app/ques.dart';

class GradientC extends StatelessWidget {
  const GradientC(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            height: 300,
            color: const Color.fromARGB(195, 255, 255, 255),
          ),
          const SizedBox(height: 35),
          Text(
            "Learn Flutter the Fun way!",
            style: GoogleFonts.josefinSans(
                color: const Color.fromARGB(255, 219, 207, 234),
                fontSize: 21.5),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              //shape: const BeveledRectangleBorder(),
              padding: const EdgeInsets.all(15),
              foregroundColor: const Color.fromARGB(255, 231, 206, 253),
              textStyle: const TextStyle(fontSize: 19),
            ),
            icon: const Icon(Icons.android_sharp),
            label: Text(
              "Let's Start",
              style: GoogleFonts.josefinSans(),
            ),
          )
        ],
      ),
    );
  }
}
