import 'package:json_annotation/json_annotation.dart';
import 'package:social_feed_api/models/user.dart';
part 'conversation.g.dart';

@JsonSerializable()
class Conversation {
  final String id;
  final String text;
  final User user;
  @JsonKey(name: 'reply_count')
  final int replyCount;
  @JsonKey(name: 'unread_count')
  final int unreadCount;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);
  Map<String, dynamic> toJson() => _$ConversationToJson(this);
  Conversation(this.id, this.text, this.user, this.replyCount, this.unreadCount, this.createdAt);
}
