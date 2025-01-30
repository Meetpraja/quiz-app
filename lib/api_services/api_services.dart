import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quiz_app/model/quiz_model.dart';

class ApiServices{

  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 50000),
      receiveTimeout: const Duration(milliseconds: 50000),
    ),
  )..interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ),
  );

  Future<QuizModel?> getQuiz() async {
    try {
      final userValue = await dio.get(
          "https://api.jsonserve.com/Uw5CrX",
      );

      if (userValue.statusCode == 200) {
        final result = QuizModel.fromJson(userValue.data);
        return result;
      } else {
        "something went wrong";
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        print("Connection Timeout Exception");
      } else {
        print("Dio Error: $e");
      }
      return null;
    } catch (e) {
      print("General Error: $e");
      return null;
    }
  }

}