import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    const double textScaler = 0.6;

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        fixedSize: const Size(30, 60),
        side: const BorderSide(width: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
        textScaler: const TextScaler.linear(textScaler),
      ),
    );
  }
}
