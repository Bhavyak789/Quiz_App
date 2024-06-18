import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/ques_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScr extends StatelessWidget {
  const ResultsScr({super.key, required this.ansList, required this.onRetake});

  final List<String> ansList;
  final void Function() onRetake;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < ansList.length; i++) {
      summary.add(
        {
          'que_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': ansList[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final totalQues = questions.length;
    final correctQues = summaryData.where(
      (data) {
        return data['user_answer'] == data['correct_answer'];
      },
    ).length;

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 70, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'You answered $correctQues out of $totalQues question correctly!',
                  style: GoogleFonts.josefinSans(
                      color: Colors.white, fontSize: 20)),
              const SizedBox(height: 30),
              QuesSummary(summaryData),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: onRetake,
                style: ElevatedButton.styleFrom(
                  //shape: const BeveledRectangleBorder(),
                  padding: const EdgeInsets.all(15),
                  foregroundColor: const Color.fromARGB(255, 221, 221, 226),
                  backgroundColor: Colors.transparent,
                  textStyle: const TextStyle(fontSize: 18),
                ),
                label: Text('Retake Quiz', style: GoogleFonts.josefinSans()),
                icon: const Icon(
                  Icons.replay,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
