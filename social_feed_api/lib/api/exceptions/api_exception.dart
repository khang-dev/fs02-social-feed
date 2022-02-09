import 'package:dio/dio.dart';
import 'api_exception_mapper.dart';

class ApiException implements Exception {
  final ApiExceptionCode apiExceptionCode;
  final String? originalExceptionCode;
  final String? debugMessage;
  final String? extraJson;
  final String? exceptionType;
  final dynamic originalException;

  ApiException({
    required this.apiExceptionCode,
    this.originalExceptionCode,
    this.debugMessage,
    this.extraJson,
    this.exceptionType,
    this.originalException,
  });

  @override
  String toString() {
    String error = "";
    if (originalException is DioError) {
      error = "API response detail: ${(originalException as DioError).response.toString()} \n";
    }

    error = "$error"
        "apiExceptionCode: ${apiExceptionCode.toString()} "
        "\n originalExceptionCode: $originalExceptionCode "
        "\n debugMessage: $debugMessage "
        "\n originalException: ${originalException.toString()}";
    return error;
  }
}
