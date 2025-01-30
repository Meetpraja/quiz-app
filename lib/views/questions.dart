import 'package:flutter/material.dart';

import '../components/answer_button.dart';
import '../model/quiz_model.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.selectedAnswer,
    required this.questions,
    required this.findCorrectAnswer,
  });
  final void Function(Option answer) selectedAnswer;
  final List<Question> questions;
  final void Function(List<Option> answer) findCorrectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsState();
}

class _QuestionsState extends State<QuestionsScreen> {

  // List<Option> shuffeldAnswers(List<Option> answer) {
  //   final shuffeldAnswerList = List.of(answer);
  //   shuffeldAnswerList.shuffle();
  //   return shuffeldAnswerList;
  // }

  List<Option> options = [];

  var currentQuestionIndex = 0;

  void answeredQuestion(Option selectedAnswer) {
    print(options.length);
    widget.findCorrectAnswer(options);
    widget.selectedAnswer(selectedAnswer);
    setState(() {
      options = [];
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[currentQuestionIndex];
    return Container(
      color: Color.fromRGBO(248, 249, 253, 1),
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text('${currentQuestionIndex+1}. ${currentQuestion.description}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30,),
            Text('Options : ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
            SizedBox(height: 20,),
            ...currentQuestion.shuffeldAnswers(currentQuestion.options!).map((Option e) {
              options.add(e as Option);
              return AnswerButton(title: e.description.toString(),
                  onTap: (){
                    answeredQuestion(e);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
