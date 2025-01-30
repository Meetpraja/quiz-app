import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quiz_app/model/quiz_model.dart';

import '../api_services/api_services.dart';


class QuizController extends GetxController{
  var isLoading = false.obs;
  var response = QuizModel().obs;
  var questions = Question().obs;
  List<Question> questionsList = [];

  @override
  void onReady(){
    super.onReady();
    questionListCon();
  }

  Future<void> questionListCon() async{
    try{
      isLoading(true);
      final newResponse = await ApiServices().getQuiz();

      if(newResponse! != null){
        response = newResponse.obs;
        questionsList.clear();
        response.value.questions?.forEach((item)=> questionsList.add(item));
        print(questionsList);
      }
      else{
        print(response.value.toString());
        Fluttertoast.showToast(msg: "Something went Wrong");
      }
    }finally{
      isLoading(false);
    }
  }
}