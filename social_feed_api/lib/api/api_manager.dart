import 'package:flutter/foundation.dart';
import '../response_models/categories_response.dart';
import 'exceptions/api_exception_mapper.dart';
import 'social_feed_api/interceptors/bearer_token_interceptor.dart';
import 'social_feed_api/interceptors/header_interceptor.dart';
import 'social_feed_api/social_feed_api.dart';
import 'social_feed_api/social_feed_dio.dart';

@protected
class ApiManager with ApiExceptionMapper {
  static ApiManager get instance => _instance;

  ApiManager._internal();

  static final ApiManager _instance = ApiManager._internal();

  late SocialFeedApi _socialFeedApi;

  init(String apiEndPoint) {
    final elfieDio = SocialFeedApiDio();
    elfieDio.options.baseUrl = apiEndPoint;
    elfieDio.interceptors.add(HeaderInterceptor());
    elfieDio.interceptors.add(BearerTokenInterceptor());
    _socialFeedApi = SocialFeedApi(elfieDio);
  }

  Future<CategoriesResponse> loadCategories() {
    return _socialFeedApi.loadCategories();
  }
}
