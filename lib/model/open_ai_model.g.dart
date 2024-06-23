// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_ai_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Messages _$MessagesFromJson(Map<String, dynamic> json) => Messages(
      role: json['role'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$MessagesToJson(Messages instance) => <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };

ChatCompletionModel _$ChatCompletionModelFromJson(Map<String, dynamic> json) =>
    ChatCompletionModel(
      model: json['model'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Messages.fromJson(e as Map<String, dynamic>))
          .toList(),
      stream: json['stream'] as bool,
    );

Map<String, dynamic> _$ChatCompletionModelToJson(
        ChatCompletionModel instance) =>
    <String, dynamic>{
      'model': instance.model,
      'messages': instance.messages,
      'stream': instance.stream,
    };
