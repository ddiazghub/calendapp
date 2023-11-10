import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:scheduler_app/components/meeting/meeting_preview.dart';
import 'package:scheduler_app/components/meeting/meeting_view.dart';
import 'package:scheduler_app/components/page/page_view.dart';
import 'package:scheduler_app/models/meeting.dart';

class MeetingPreviewCard extends StatelessWidget {
  const MeetingPreviewCard({
    super.key,
    required this.meeting,
  });

  final Meeting meeting;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openBuilder: (context, closedContainer) {
        return AppView(title: 'Reunión', child: MeetingView(meeting: meeting));
      },
      openColor: Colors.white,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      closedElevation: 0,
      closedColor: Colors.red,
      closedBuilder: (context, openContainer) {
        return MeetingPreview(
          meeting: meeting,
          onTap: openContainer,
        );
      },
    );
  }
}
