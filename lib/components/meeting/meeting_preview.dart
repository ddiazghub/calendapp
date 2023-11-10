import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:scheduler_app/components/meeting/meeting_action_bar.dart';
import 'package:scheduler_app/components/query_builder.dart';
import 'package:scheduler_app/models/meeting.dart';
import 'package:scheduler_app/models/user.dart';

class MeetingPreview extends StatelessWidget {
  const MeetingPreview({
    super.key,
    required this.meeting,
    required this.onTap,
  });

  final Meeting meeting;
  final VoidCallback onTap;

  static TextStyle? themeOf(TextStyle? theme) {
    return theme?.copyWith(color: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(meeting.title, style: themeOf(textTheme.headlineSmall)),
                            const SizedBox(height: 4),
                            Text(
                              switch (meeting.status) {
                                MeetingStatus.scheduled =>
                                  'Reunión ${Moment(meeting.start).fromNow()} en ${meeting.location}',
                                MeetingStatus.started =>
                                  'Reunión en progreso en ${meeting.location}',
                                MeetingStatus.ended =>
                                  'Reunión ${Moment(meeting.end).fromNow()} en ${meeting.location}',
                              },
                              style: themeOf(textTheme.bodySmall),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                      QueryBuilder(
                          ref: UserRef.whereUid(
                            whereIn: [meeting.host, ...meeting.invitees],
                          ),
                          builder: (context, snapshot) {
                            return MeetingActionBar(
                              light: true,
                              meeting: meeting,
                              participants: snapshot.docs.map((e) => e.data),
                            );
                          }),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: 20,
                    ),
                    child: Text(
                      meeting.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: themeOf(textTheme.bodyMedium),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
