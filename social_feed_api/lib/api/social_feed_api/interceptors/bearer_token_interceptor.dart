import 'package:dio/dio.dart';

class BearerTokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // TO DO: load token from secured storage
    String? userToken;
    if (userToken != null) {
      options.headers.addAll({"Authorization": "Bearer $userToken"});
    }

    handler.next(options);
  }
}
