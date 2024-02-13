import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final bool isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                itemData['correct_answer'].toString(),
                style: const TextStyle(color: Colors.green),
              ),
              if (!isCorrectAnswer) ...[
                Text(
                  itemData['user_answer'] as String,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
