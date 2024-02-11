import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              final bool isCorrectAnswer =
                  data['user_answer'] == data['correct_answer'];
              return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isCorrectAnswer ? Colors.green : Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            data['user_answer'] as String,
                            style: TextStyle(
                              color:
                                  isCorrectAnswer ? Colors.green : Colors.red,
                            ),
                          ),
                          Text(
                            data['correct_answer'].toString(),
                            style: const TextStyle(color: Colors.green),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ]);
            },
          ).toList(),
        ),
      ),
    );
  }
}
