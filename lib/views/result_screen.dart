import 'package:auto_size_text/auto_size_text.dart';
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

  @override
  Widget build(BuildContext context) {
    int score = summaryData
        .where(
          (data) => data['selected_ans'] == data['correct_ans'],
    )
        .length;
    int total = summaryData.length;

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:  Color.fromRGBO(64, 125, 216, 1.0),
        title: Text('Result',style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w700),),
      ),
      backgroundColor: Color.fromRGBO(248, 249, 253, 1),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 40),
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20,top: 20 ),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape:BoxShape.circle,
                    color: Color.fromRGBO(15, 70, 154, 1.0),
                    border: Border.all(width: 7,color: Color.fromRGBO(64, 125, 216, 1.0),),
                  ),
                  child: Column(
                    children: [
                      Text('SCORE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                      Text('$score / $total',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
                Expanded(
                  child: AutoSizeText(
                    'YOU scored $score OUT OF $total QUESTIONS',
                    style: TextStyle(
                        color:Color.fromRGBO(51, 51, 51, 1.0),
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Summary(summaryData: summaryData,),
            Spacer(),
            StartButton(title: 'Back to Home', onStart: (){
              Get.back();
            })
          ],
        ),
      ),
    );
  }
}
