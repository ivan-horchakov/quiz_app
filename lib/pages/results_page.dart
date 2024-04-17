import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/questions_summary/questions_summary.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    const double textScaler = 0.8;

    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Spacer(flex: 9),
          Text(
            'You answered $numCorrectQuestion out of $numTotalQuestions questions correctly!',
            style: const TextStyle(color: Colors.white, fontSize: 27),
            textAlign: TextAlign.center,
            textScaler: const TextScaler.linear(textScaler),
          ),
          const Spacer(flex: 6),
          QuestionsSummary(summaryData),
          const Spacer(flex: 6),
          FilledButton(
            onPressed: onRestart,
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            child: const Text(
              'Let me try again',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textScaler: TextScaler.linear(textScaler),
            ),
          ),
          const Spacer(flex: 12),
        ],
      ),
    );
  }
}
