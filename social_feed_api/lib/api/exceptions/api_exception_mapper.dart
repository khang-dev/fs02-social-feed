import 'api_exception.dart';

mixin ApiExceptionMapper {
  ApiException mapApiException(String errorCode, dynamic originalException) {
    return ApiException(
        apiExceptionCode: _apiExceptionCodeMap[errorCode] ?? ApiExceptionCode.unexpectedError,
        originalException: originalException,
        originalExceptionCode: errorCode,
        exceptionType: originalException.runtimeType.toString());
  }

  // Mapping from API error code to pre-defined Client error code
  static final Map<String, ApiExceptionCode> _apiExceptionCodeMap = {
    'unexpectedError': ApiExceptionCode.unexpectedError,
  };
}

enum ApiExceptionCode {
  unexpectedError,
  unauthorized,
}
