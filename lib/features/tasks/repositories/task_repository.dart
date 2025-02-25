import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:task_management_app/core/constants/api_constants.dart';
import 'package:task_management_app/core/error/api_exception.dart';
import 'package:task_management_app/features/shared/model/task_model.dart';

final taskRepositoriesProvider = Provider((ref) => TaskRepositories(),);

class TaskRepositories {

  final Dio _dioClient = Dio();
  final ExceptionHandler _exceptionHandler = ExceptionHandler();

  Future<Either<String, List<FetchTaskModel>>> getAllTasks() async {
    try {
      _dioClient.options.headers['Content-Type'] = 'application/json';
      final response = await _dioClient.get(ApiConstants.getTaskBaseUrl);
      print('Response data type: ${response.data.runtimeType}');

      if (response.statusCode == 200 && response.data != null) {
        // Decode the JSON response into a List<dynamic>
        final List<dynamic> data = jsonDecode(response.data);

        // Map each item in the list to a FetchTaskModel
        final tasks = data.map((json) => FetchTaskModel.fromJson(json)).toList();

        return right(tasks);
      } else {
        return left(_exceptionHandler.getErrorMessage(response.statusCode));
      }
    } on DioException catch (e, s) {
      print(e);
      print(s);
      return left(_exceptionHandler.getExceptionMessage(e));
    } catch (e, s) {
      print(s);
      return left('Unknown Error Occurred');
    }
  }

}
