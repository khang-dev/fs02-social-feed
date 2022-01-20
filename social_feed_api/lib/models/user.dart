import 'package:json_annotation/json_annotation.dart';
import 'package:social_feed_api/models/picture.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  final String gender;
  final String name;
  final String email;
  final DateTime dob;
  final DateTime registered;
  final String phone;
  final String status;
  final Picture picture;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
  User(this.gender, this.name, this.email, this.dob, this.registered, this.phone, this.status, this.picture);
}
