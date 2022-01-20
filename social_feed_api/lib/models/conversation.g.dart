// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) => Conversation(
      json['id'] as String,
      json['text'] as String,
      User.fromJson(json['user'] as Map<String, dynamic>),
      json['reply_count'] as int,
      json['unread_count'] as int,
      DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'user': instance.user,
      'reply_count': instance.replyCount,
      'unread_count': instance.unreadCount,
      'created_at': instance.createdAt.toIso8601String(),
    };
