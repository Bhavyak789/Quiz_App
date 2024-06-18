import 'package:flutter/material.dart';

class Testin extends StatelessWidget {
  const Testin({super.key});

  @override
  Widget build(context) {
    return (Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red, Colors.yellow])),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/meme.png',
              width: 250,
            ),
            const SizedBox(height: 25),
            const Text(
              "This is a Test!\n Result : PASS",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ],
        ),
      ),
    ));
  }
}
