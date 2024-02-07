import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset('assets/images/quiz-logo.png', width: 300),
          // ),
          Image.asset('assets/images/quiz-logo.png',
              width: 300, color: const Color.fromARGB(200, 248, 247, 247)),
          const SizedBox(height: 50),
          const Text('Learn Flutter the fun way!',
              style: TextStyle(color: Colors.white, fontSize: 24)),
          const SizedBox(height: 30),
          OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.cyan),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz')),
        ],
      ),
    );
  }
}