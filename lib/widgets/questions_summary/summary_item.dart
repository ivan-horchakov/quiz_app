import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final bool isCorrectAnswer = itemData['user_answer'] == itemData['correct_answer'];
    const double textScaler = 1.0;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        const Spacer(flex: 1),
        Expanded(
          flex: 12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: const TextStyle(color: Colors.white, fontSize: 15),
                textScaler: const TextScaler.linear(textScaler),
              ),
              Text(
                itemData['correct_answer'].toString(),
                style: const TextStyle(color: Colors.green),
                textScaler: const TextScaler.linear(textScaler),
              ),
              if (!isCorrectAnswer) ...[
                Text(
                  itemData['user_answer'] as String,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                  textScaler: const TextScaler.linear(textScaler),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
