import 'package:flutter/material.dart';

import '../components/answer_button.dart';
import '../model/quiz_model.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.selectedAnswer,
    required this.questions,
    required this.findCorrectAnswer,
    required this.onBack,
  });
  final void Function(Option answer) selectedAnswer;
  final List<Question> questions;
  final void Function(List<Option> answer) findCorrectAnswer;
  final void Function() onBack;

  @override
  State<QuestionsScreen> createState() => _QuestionsState();
}

class _QuestionsState extends State<QuestionsScreen> {

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

  void onPreviousQuestion(){
    if(currentQuestionIndex > 0){
      setState(() {
        options = [];
        currentQuestionIndex--;
      });
    }else{
      setState(() {
        options = [];
      });
      widget.onBack();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[currentQuestionIndex];
    return Container(
      color: Color.fromRGBO(248, 249, 253, 1),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
            decoration: BoxDecoration(
                color: Color.fromRGBO(242, 240, 239, 1.0),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 10,
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap : onPreviousQuestion,
                  child: Row(
                    spacing : 5,
                    children: [
                      Icon(Icons.arrow_back_outlined,color: Color.fromRGBO(15, 70, 154, 1.0),),
                      Text('previous',style: TextStyle(color: Color.fromRGBO(15, 70, 154, 1.0)),),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  'Question : ${currentQuestionIndex + 1} / ${widget.questions.length}',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    '${currentQuestion.description}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ...currentQuestion
                    .shuffeldAnswers(currentQuestion.options!)
                    .map((Option e) {
                  options.add(e as Option);
                  return AnswerButton(
                      title: e.description.toString(),
                      onTap: () {
                        answeredQuestion(e);
                      });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
