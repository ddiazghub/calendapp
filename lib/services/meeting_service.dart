import 'package:async/async.dart';
import 'package:get/get.dart';
import 'package:scheduler_app/models/meeting.dart';

class MeetingService extends GetxController {
  final _meetings = <Meeting>[].obs;

  List<Meeting> get meetings => _meetings;

  set meetings(List<Meeting> value) => _meetings.value = value;

  Stream<List<MeetingQueryDocumentSnapshot>> getMeetings(String userId) {
    final hosted = MeetingRef.whereHost(isEqualTo: userId);
    final invited = MeetingRef.whereInvitees(arrayContains: userId);
    final zip = StreamZip([hosted.snapshots(), invited.snapshots()]);

    return zip.map((event) => [...event[0].docs, ...event[1].docs]);
  }
}
