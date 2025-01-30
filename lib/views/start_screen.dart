import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/views/questions.dart';
import 'package:quiz_app/views/result_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key, required this.quiz});

  final QuizModel quiz;

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool isQuestion = false;

  List<Option> selectedAnswer = [];
  List<Option> correctAnswers = [];
  List<Map<String, dynamic>> summaryData = [];

  void doSummary() {
    try {
      for (int i = 0; i < widget.quiz.questions!.length; i++) {
        summaryData.add({
          'index': i,
          'question': widget.quiz.questions?[i].description,
          'selected_ans': selectedAnswer[i].description,
          'correct_ans': correctAnswers[i].description
        });
      }
    } catch (e) {
      log('Error : $e');
    }
  }

  void chooseAnswer(Option answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == widget.quiz.questions?.length) {
      doSummary();
      setState(() {
        selectedAnswer = [];
        isQuestion = false;
        title = 'available quizzes';
        Get.to(() => ResultScreen(
              summaryData: summaryData,
            ))?.then((value) {
          summaryData = [];
        });
      });
    }
  }

  void getCorrectAnswers(List<Option> options) {
    for (var op in options) {
      if (op.isCorrect!) {
        correctAnswers.add(op);
      }
    }
  }

  void onBack() {
    setState(() {
      isQuestion = false;
      title = 'available quizzes';
    });
  }

  void startQuiz() {
    setState(() {
      isQuestion = true;
      title = 'Questions';
    });
  }

  String title = 'available quizzes';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 125, 216, 1.0),
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Color.fromRGBO(255, 243, 224, 1.0),
      body: isQuestion
          ? QuestionsScreen(
              selectedAnswer: chooseAnswer,
              questions: widget.quiz.questions!,
              findCorrectAnswer: getCorrectAnswers,
              onBack: onBack,
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              height: size.height,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(111, 162, 241, 1.0),
                        borderRadius: BorderRadius.circular(20)),
                    height: 100,
                    width: size.width,
                    child: Row(
                      spacing: 8,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: 15, top: 20, bottom: 20),
                          height: 100,
                          child: Row(
                            children: [
                              Text('1.',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: (size.width - size.width / 3) - 10,
                                child: AutoSizeText(
                                  widget.quiz.title.toString(),
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: startQuiz,
                          child: Container(
                              height: 100,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(90, 130, 241, 1.0),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              child: Icon(
                                Icons.navigate_next_rounded,
                                size: 40,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
