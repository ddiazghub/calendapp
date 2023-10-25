import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:scheduler_app/helpers.dart';

import 'firestore_serializable.dart';

part 'meeting.g.dart';

@FirestoreSerializable
class Meeting {
  const Meeting(
    this.name,
    this.description,
    this.host,
    this.location,
    this.invitees,
    this.start,
    this.end,
    this.createdAt,
  );

  @JsonKey(fromJson: Converters.localTime)
  final DateTime createdAt;

  @JsonKey(fromJson: Converters.localTime)
  final DateTime start;

  @JsonKey(fromJson: Converters.localTime)
  final DateTime end;

  final String name;
  final String description;
  final String host;
  final String location;
  final List<String> invitees;

  factory Meeting.fromJson(Map<String, Object?> json) =>
      _$MeetingFromJson(json);

  Map<String, Object?> toJson() => _$MeetingToJson(this);
}

@Collection<Meeting>('messages')
final MeetingRef = MeetingCollectionReference();
