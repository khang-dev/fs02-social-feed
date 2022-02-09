import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  final String id;
  final int status;
  final String title;
  final String description;
  @JsonKey(name: 'photo_counts')
  final int photoCounts;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  const Category(this.id, this.status, this.title, this.description, this.photoCounts, this.createdAt, this.updatedAt);
}
