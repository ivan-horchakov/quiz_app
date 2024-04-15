import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatelessWidget {
  const StartPage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const double textScaler = 1.0;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: screenWidth - 100,
          ),
          const SizedBox(height: 50),
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
          const SizedBox(height: 63),
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
          const SizedBox(height: 18),
          OutlinedButton(
            onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            child: const Text(
              "No, I'm not...",
              style: TextStyle(
                color: Colors.white,
              ),
              textScaler: TextScaler.linear(textScaler),
            ),
          ),
        ],
      ),
    );
  }
}