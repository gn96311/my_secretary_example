//Message
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'open_ai_model.g.dart';

@JsonSerializable()
class Messages {
  final String? role;
  final String? content;

  Messages({this.role, this.content});

  factory Messages.fromJson(Map<String, dynamic> json) =>
      _$MessagesFromJson(json);

  Map<String, dynamic> toJson() => _$MessagesToJson(this);

  Messages copyWith({String? role, String? content}) {
    return Messages(
      role: role ?? this.role,
      content: content ?? this.content,
    );
  }
}

//ChatCompletionModel

@JsonSerializable()
class ChatCompletionModel{
  late final String model;
  late final List<Messages> messages;
  late final bool stream;

  ChatCompletionModel({required this.model, required this.messages, required this.stream});

  factory ChatCompletionModel.fromJson(Map<String, dynamic> json) => _$ChatCompletionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChatCompletionModelToJson(this);
}
