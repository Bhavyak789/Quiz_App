import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuesSummary extends StatelessWidget {
  const QuesSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return Column(
      children: summaryData.map(
        (data) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${(data['que_index'] as int) + 1}. ',
                style:
                    GoogleFonts.josefinSans(color: Colors.white, fontSize: 15),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data['question'] as String,
                        style: GoogleFonts.josefinSans(color: Colors.white)),
                    const SizedBox(height: 5),
                    Text(data['user_answer'] as String,
                        style: GoogleFonts.josefinSans(
                            color: const Color.fromARGB(255, 76, 122, 247),
                            fontSize: 15)),
                    Text(data['correct_answer'] as String,
                        style: GoogleFonts.josefinSans(
                            color: const Color.fromARGB(189, 63, 255, 249),
                            fontSize: 15)),
                    const SizedBox(height: 40)
                  ],
                ),
              )
            ],
          );
        },
      ).toList(),
    );
  }
}
