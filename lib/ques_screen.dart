import 'package:flutter/material.dart';
import 'package:quiz_app/ans_button.dart';
import 'package:quiz_app/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QueScreen extends StatefulWidget {
  const QueScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QueScreen> createState() {
    return _QueScreen();
  }
}

class _QueScreen extends State<QueScreen> {
  var qno = 0;
  void answered(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      qno++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[qno];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.josefinSans(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnd().map(
              (answer) {
                return AnsButton(
                    answerText: answer,
                    onTap: () {
                      answered(answer);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
