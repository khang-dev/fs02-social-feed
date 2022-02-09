import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HeaderInterceptor extends Interceptor {
  static final HeaderInterceptor _instance = HeaderInterceptor._internal();

  factory HeaderInterceptor() {
    return _instance;
  }

  HeaderInterceptor._internal();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String userAgent = "SocialFeedApp_FS02/${packageInfo.version} (${packageInfo.buildNumber})";
    options.headers.addAll({"User-Agent": userAgent});
    handler.next(options);
  }
}
