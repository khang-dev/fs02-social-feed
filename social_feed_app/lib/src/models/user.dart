import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String displayName;
  final String avatarUrl;
  final bool isActive;
  final bool hasStory;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User(this.displayName, this.avatarUrl, this.isActive, this.id, this.hasStory);
}
