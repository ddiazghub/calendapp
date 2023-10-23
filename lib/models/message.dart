import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import 'firestore_serializable.dart';

part 'message.g.dart';

@FirestoreSerializable
class Message {
  const Message(this.text, this.createdAt, this.user);

  @JsonKey(fromJson: _localTime)
  final DateTime createdAt;
  final String text;
  final String user;

  factory Message.fromJson(Map<String, Object?> json) =>
      _$MessageFromJson(json);

  Map<String, Object?> toJson() => _$MessageToJson(this);

  static DateTime _localTime(Timestamp time) => time.toDate();
}

@Collection<Message>('messages')
final MessageRef = MessageCollectionReference();
