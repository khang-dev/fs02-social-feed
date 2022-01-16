import 'package:json_annotation/json_annotation.dart';
part 'conversation.g.dart';

@JsonSerializable()
class Conversation {
  final int id;
  final String title;
  final String lastMessage;
  final String avatarUrl;
  final DateTime lastUpdatedTime;
  final bool isUnread;

  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);
  Map<String, dynamic> toJson() => _$ConversationToJson(this);

  Conversation(this.title, this.lastMessage, this.avatarUrl, this.lastUpdatedTime, this.id, this.isUnread);
}
