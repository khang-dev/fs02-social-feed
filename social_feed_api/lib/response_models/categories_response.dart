import 'package:json_annotation/json_annotation.dart';

import '../models/category.dart';
import 'base_response.dart';
part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse extends BaseResponse {
  final List<Category> data;

  CategoriesResponse(
    this.data, {
    int? code,
  }) : super(code: code);

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}
