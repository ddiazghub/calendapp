import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler_app/components/avatar_row.dart';
import 'package:scheduler_app/components/query_builder.dart';
import 'package:scheduler_app/helpers.dart';
import 'package:scheduler_app/models/meeting.dart';
import 'package:scheduler_app/models/user.dart';
import 'package:scheduler_app/routes.dart';
import 'package:scheduler_app/services/auth_service.dart';

class MeetingActionBar extends GetView<AuthService> {
  const MeetingActionBar({
    super.key,
    required this.meeting,
    required this.participants,
    this.light = false,
  });

  final Meeting meeting;
  final Iterable<UserData> participants;
  final bool light;

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
              message: 'Ver en calendario',
              child: IconButton(
                icon: Icon(Icons.calendar_today, color: light ? Colors.white : null),
                onPressed: () =>
                    Get.offNamed(Routes.calendar, arguments: meeting.start),
              ),
            ),
            if (meeting.host == controller.user?.uid) ...[
              Tooltip(
                message: 'Editar reunión',
                child: IconButton(
                  icon: Icon(Icons.edit, color: light ? Colors.white : null),
                  onPressed: () =>
                      Get.offNamed(Routes.schedule, arguments: meeting),
                ),
              ),
              Tooltip(
                message: 'Eliminar reunión',
                child: IconButton(
                  icon: Icon(Icons.delete, color: light ? Colors.white : null),
                  onPressed: () => deleteDoc(
                    context,
                    MeetingRef,
                    meeting.id,
                  ),
                ),
              ),
            ],
            const SizedBox(width: 12),
          ],
        );
      },
    );
  }
}
