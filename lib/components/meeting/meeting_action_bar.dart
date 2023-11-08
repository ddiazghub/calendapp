import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler_app/components/avatar_row.dart';
import 'package:scheduler_app/components/query_builder.dart';
import 'package:scheduler_app/helpers.dart';
import 'package:scheduler_app/models/meeting.dart';
import 'package:scheduler_app/models/user.dart';
import 'package:scheduler_app/routes.dart';

class MeetingActionBar extends StatelessWidget {
  const MeetingActionBar({
    super.key,
    required this.meeting,
    required this.participants,
  });

  final Meeting meeting;
  final Iterable<UserData> participants;

  @override
  Widget build(BuildContext context) {
    return QueryBuilder(
      ref: UserRef.whereUid(whereIn: [...meeting.invitees, meeting.host]),
      builder: (context, data) {
        return Row(
          children: [
            AvatarRow(users: data.docs.map((snapshot) => snapshot.data)),
            const SizedBox(width: 30),
            Tooltip(
              message: 'View in calendar',
              child: IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () => Get.offNamed(Routes.calendar, arguments: meeting.start),
              ),
            ),
            Tooltip(
              message: 'Edit Meeting',
              child: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () =>
                    Get.offNamed(Routes.schedule, arguments: meeting),
              ),
            ),
            Tooltip(
              message: 'Delete Meeting',
              child: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => deleteDoc(
                  context,
                  MeetingRef,
                  meeting.id,
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        );
      },
    );
  }
}
