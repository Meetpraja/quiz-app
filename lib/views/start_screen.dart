import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/components/start_button.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/views/questions.dart';
import 'package:quiz_app/views/result_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({
    super.key,
  required this.quiz
  });

  final QuizModel quiz;

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  bool isQuestion = false;

  List<Option> selectedAnswer = [];
  List<Option> correctAnswers = [];
  List<Map<String,dynamic>> summaryData = [];

  void doSummary(){
    try{
      print('doing summary');
      for(int i=0;i<widget.quiz.questions!.length;i++){
        print(widget.quiz.questions?[i]);
        print(selectedAnswer[i]);
        print(correctAnswers[i]);
        summaryData.add({
          'index' : i,
          'question' : widget.quiz.questions?[i].description,
          'selected_ans' : selectedAnswer[i].description,
          'correct_ans' : correctAnswers[i].description
        });
      }
      print(summaryData);
    }catch (e){
      print('Error : $e');
    }
  }

  void chooseAnswer(Option answer) {
    selectedAnswer.add(answer);
    print(selectedAnswer.length);
    print(widget.quiz.questions?.length);
    if (selectedAnswer.length == widget.quiz.questions?.length) {
      print('in the condition');
     doSummary();
      print(selectedAnswer);
      setState(() {
        selectedAnswer = [];
        isQuestion = false;
        Get.to(()=>ResultScreen(summaryData: summaryData,))?.then((value){
          summaryData = [];
        });
      });
    }
  }
  void getCorrectAnswers(List<Option> options){
    print(options);
    for(var op in options){
      if(op.isCorrect!){
        correctAnswers.add(op);
      }
    }
    print(correctAnswers);
  }


  void startQuiz(){
    setState(() {
      isQuestion = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 243, 224, 1.0),
      body:
      isQuestion
          ? QuestionsScreen(selectedAnswer: chooseAnswer, questions: widget.quiz.questions!,findCorrectAnswer: getCorrectAnswers,)
          : Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Text('Quiz of',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            Text(widget.quiz.title.toString(),style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            SizedBox(height: 50,),
            Text(
              'ready for the quiz ?',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10,),
            StartButton(title: 'start',onStart: startQuiz,),
          ],
        ),
      ),
    );
  }
}
