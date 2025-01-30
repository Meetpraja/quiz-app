import 'package:flutter/material.dart';
import 'package:quiz_app/components/start_button.dart';
import 'package:quiz_app/components/summary.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
   ResultScreen({
    super.key,
    required this.summaryData,
  });

  final List<Map<String,dynamic>> summaryData;

  int? score;
  int? total;

  getScore(){
    score = summaryData
        .where(
          (data) => data['selected_ans'] == data['correct_ans'],
    )
        .length;
    total = summaryData.length;
  }

  @override
  Widget build(BuildContext context) {
    getScore();

    print(summaryData[0]['question']);

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(86, 204, 242, 1.0),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Result',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 28),),
            SizedBox(height: 10,),
            Text(
              'YOU scored $score OUT OF $total QUESTIONS',
              style: TextStyle(
                color:Color.fromRGBO(51, 51, 51, 1.0),
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Summary(summaryData: summaryData,),
            const SizedBox(height: 30),
            StartButton(title: 'Restart quiz', onStart: (){
              Get.back();
            })
          ],
        ),
      ),
    );
  }
}
