import 'package:flutter/material.dart';

import 'identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, dynamic> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['selected_ans'] == itemData['correct_ans'];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 15
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(242, 240, 239, 1.0),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4
            ),
          ],
          
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuestionIdentifier(
              isCorrectAnswer: isCorrectAnswer,
              questionIndex: itemData['index'] as int,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemData['question'] as String,
                    style: TextStyle(
                      color:Color.fromARGB(255, 26, 35, 126),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('your ans : ${itemData['selected_ans']}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: itemData['selected_ans'] == itemData['correct_ans']
                              ? Color.fromARGB(255, 76, 175, 80)
                              : Colors.red
                      )),
                  Text('correct ans : ${itemData['correct_ans']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color.fromARGB(255, 76, 175, 80),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}