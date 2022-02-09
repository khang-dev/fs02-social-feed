import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../response_models/categories_response.dart';
part 'social_feed_api.g.dart';

@RestApi()
abstract class SocialFeedApi {
  factory SocialFeedApi(Dio dio, {String baseUrl}) = _SocialFeedApi;

  @GET("v1/categories")
  Future<CategoriesResponse> loadCategories();
}
