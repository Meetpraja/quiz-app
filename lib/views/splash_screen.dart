import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quiz_app/api_services/api_services.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/views/start_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  QuizModel? myQuiz;

  void getQuizInfo()async{
    try{
      myQuiz = await ApiServices().getQuiz();
    }catch (e){
      Fluttertoast.showToast(msg: 'Error : ${e.toString()}',);
    }
  }

  getPage()  {
     Timer(
      Duration(seconds: 3),
        () {
          Get.off(() => StartScreen(quiz: myQuiz!,));
        }
    );
  }


  @override
  void initState() {
    super.initState();
    getQuizInfo();
    getPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(111, 162, 241, 1.0),
      body: Center(
        child: Image.asset('assets/splash_icon.png',color: Color.fromRGBO(
            34, 87, 173, 1.0)),
      ),
    );
  }
}
