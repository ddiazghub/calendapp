import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scheduler_app/helpers.dart';
import 'package:scheduler_app/models/annotations.dart';

part 'message.g.dart';

@FirestoreSerializable
class Message {
  const Message(this.text, this.user, this.meeting, this.createdAt);

  @DateTimeField
  final DateTime createdAt;
  final String text;
  final String user;
  final String meeting;

  factory Message.fromJson(Map<String, Object?> json) =>
      _$MessageFromJson(json);

  Map<String, Object?> toJson() => _$MessageToJson(this);
}

@Collection<Message>('messages')
final MessageRef = MessageCollectionReference();
