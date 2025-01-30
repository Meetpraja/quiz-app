import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quiz_app/model/quiz_model.dart';

class ApiServices{

  String apiUrl = dotenv.env['API_URL'] ?? '';

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
         apiUrl!,
      );

      if (userValue.statusCode == 200) {
        final result = QuizModel.fromJson(userValue.data);
        return result;
      } else {
        "something went wrong";
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        log('Connection Timeout Exception');
      } else {
        log('Dio Error: $e');
      }
      return null;
    } catch (e) {
      log('General Error: $e');
      return null;
    }
  }

}