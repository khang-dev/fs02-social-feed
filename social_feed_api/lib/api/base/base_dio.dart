import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import '../exceptions/api_exception.dart';
import '../exceptions/api_exception_mapper.dart';

abstract class BaseDio extends DioForNative {
  @override
  Future<Response<T>> fetch<T>(RequestOptions requestOptions) async {
    try {
      return await super.fetch(requestOptions);
    } catch (e) {
      if (e is DioError) {
        throw _parseDioException(e);
      }
      throw ApiException(
        apiExceptionCode: ApiExceptionCode.unexpectedError,
        debugMessage: "Unknow error",
        originalException: e,
      );
    }
  }

  @override
  Future<Response<T>> request<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await super.request(path,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          options: options,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
    } catch (e) {
      if (e is DioError) {
        throw _parseDioException(e);
      }
      throw ApiException(
        apiExceptionCode: ApiExceptionCode.unexpectedError,
        debugMessage: "Unknow error",
        originalException: e,
      );
    }
  }

  ApiException _parseDioException(DioError error) {
    ApiException apiException;
    switch (error.type) {
      case DioErrorType.cancel:
        apiException = ApiException(
          apiExceptionCode: ApiExceptionCode.unexpectedError,
          debugMessage: "Request was cancelled",
          originalException: error,
        );
        break;
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        apiException = ApiException(
          originalException: error.response,
          apiExceptionCode: ApiExceptionCode.unexpectedError,
        );
        break;
      case DioErrorType.other:
        apiException = ApiException(
          apiExceptionCode: ApiExceptionCode.unexpectedError,
          debugMessage: "Connection failed due to internet connection",
          originalException: error,
        );
        break;
      case DioErrorType.response:
        apiException = _parseDioErrorWithResponse(error);
        break;
    }
    return apiException;
  }

  ApiException _parseDioErrorWithResponse(DioError dioError) {
    if (dioError.response == null) {
      return ApiException(
        apiExceptionCode: ApiExceptionCode.unexpectedError,
        debugMessage: "response null",
        originalException: dioError,
      );
    }
    final response = dioError.response!;

    if (response.data != null && response.data.toString().isNotEmpty) {
      if (response.data is Map) {
        return mapErrorResponseData(response.data, originalError: dioError);
      }
    }

    switch (response.statusCode) {
      case HttpStatusCode.badRequestCode:
      case HttpStatusCode.notFoundCode:
      case HttpStatusCode.tooManyRequestCode:
      case HttpStatusCode.internalSeverErrorCode:
      case HttpStatusCode.serviceUnavailableCode:
        return ApiException(
          apiExceptionCode: ApiExceptionCode.unexpectedError,
          debugMessage: "Connection failed due to internet connection",
          originalException: response.data,
        );
      case HttpStatusCode.unauthorizedCode:
        return ApiException(
          apiExceptionCode: ApiExceptionCode.unauthorized,
          originalException: response.data,
        );

      default:
        return ApiException(
          apiExceptionCode: ApiExceptionCode.unexpectedError,
          debugMessage: "Connection failed due to internet connection",
          originalException: response.data,
        );
    }
  }

  ApiException mapErrorResponseData(Map data, {required DioError originalError});
}

class HttpStatusCode {
  static const int badRequestCode = 400;
  static const int unauthorizedCode = 401;
  static const int notFoundCode = 404;
  static const int tooManyRequestCode = 429;
  static const int internalSeverErrorCode = 500;
  static const int serviceUnavailableCode = 503;
}
