import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.cyan,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/quiz-logo.png', width: 300),
                const SizedBox(height: 50),
                const Text('Learn Flutter the fun way!',
                    style: TextStyle(color: Colors.white, fontSize: 23)),
                const SizedBox(height: 30),
                const OutlinedButton(
                    onPressed: null,
                    child: Text('Start Quiz',
                        style: TextStyle(color: Colors.white)))
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
