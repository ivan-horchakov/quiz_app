import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatelessWidget {
  const StartPage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    const double textScaler = 1.0;

    return Center(
      child: Column(
        children: [
          const Spacer(flex: 6),
          Image.asset('assets/images/quiz-logo.png'),
          const Spacer(flex: 3),
          Text(
            "So you think you're smart?!",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            textScaler: const TextScaler.linear(textScaler),
          ),
          const Spacer(flex: 3),
          FilledButton(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            child: const Text(
              'Yes, I am!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textScaler: TextScaler.linear(textScaler),
            ),
          ),
          const Spacer(flex: 6),
        ],
      ),
    );
  }
}
