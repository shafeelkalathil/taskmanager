import 'dart:io';
import 'package:dio/dio.dart';


class ExceptionHandler {
  String getErrorMessage(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Invalid request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Access forbidden';
      case 404:
        return 'Resource not found';
      case 429:
        return 'Too many requests';
      case 500:
        return 'Internal server error';
      default:
        return 'Unknown error';
    }
  }

  String getExceptionMessage(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timed out. Please check your internet connection.';
      case DioExceptionType.badResponse:
        return getErrorMessage(exception.response?.statusCode);
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network.';
      case DioExceptionType.badCertificate:
        return 'Something Bad happened';
      case DioExceptionType.unknown:
        if (exception.error is SocketException) {
          return 'No internet connection. Please check your network.';
        }
        return 'An unexpected error occurred.';
    }
  }
}
