import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  final int? code;

  BaseResponse({this.code});

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);
}
