import 'package:dio/dio.dart';
import '../base/base_dio.dart';
import '../exceptions/api_exception.dart';
import '../exceptions/api_exception_mapper.dart';

class SocialFeedApiDio extends BaseDio with ApiExceptionMapper {
  @override
  ApiException mapErrorResponseData(Map data, {required DioError originalError}) {
    if (!data.containsKey('code')) {
      return ApiException(apiExceptionCode: ApiExceptionCode.unexpectedError, originalException: originalError);
    }
    String elfieErrorCode = data['code'];
    return mapApiException(elfieErrorCode, originalError);
  }
}
