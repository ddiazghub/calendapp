import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scheduler_app/helpers.dart';
import 'package:scheduler_app/models/annotations.dart';

part 'meeting.g.dart';

@FirestoreSerializable
class Meeting {
  const Meeting(
    this.title,
    this.description,
    this.host,
    this.location,
    this.invitees,
    this.start,
    this.end,
    this.createdAt, {
    this.id = '',
  });

  @DateTimeField
  final DateTime createdAt;

  @DateTimeField
  final DateTime start;

  @DateTimeField
  final DateTime end;

  @Id()
  final String id;

  final String title;
  final String description;
  final String host;
  final String location;
  final List<String> invitees;

  MeetingStatus get status {
    final now = DateTime.now();

    if (now.isBefore(start)) {
      return MeetingStatus.scheduled;
    }

    if (now.isBefore(end)) {
      return MeetingStatus.started;
    }

    return MeetingStatus.ended;
  }

  factory Meeting.fromJson(Map<String, Object?> json) =>
      _$MeetingFromJson(json);

  Map<String, Object?> toJson() => _$MeetingToJson(this);
}

enum MeetingStatus {
  scheduled,
  started,
  ended,
}

@Collection<Meeting>('meetings')
final MeetingRef = MeetingCollectionReference();
