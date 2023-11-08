import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scheduler_app/components/chat.dart';
import 'package:scheduler_app/components/meeting/meeting_action_bar.dart';
import 'package:scheduler_app/components/query_builder.dart';
import 'package:scheduler_app/components/divider.dart';
import 'package:scheduler_app/models/meeting.dart';
import 'package:scheduler_app/models/user.dart';

class MeetingView extends StatelessWidget {
  const MeetingView({
    super.key,
    required this.meeting,
  });

  final Meeting meeting;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: double.infinity,
          child: Material(
            color: Theme.of(context).cardColor,
            child: SingleChildScrollView(
              padding: const EdgeInsetsDirectional.only(
                top: 42,
                start: 20,
                end: 20,
              ),
              child: QueryBuilder(
                ref: UserRef.whereUid(
                  whereIn: [meeting.host, ...meeting.invitees],
                ),
                builder: (context, data) {
                  final users =
                      data.docs.map((snapshot) => snapshot.data).toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _MeetingViewHeader(meeting: meeting, participants: users),
                      const HDivider(),
                      SizedBox(
                        height: 100,
                        child: SingleChildScrollView(
                          child: SelectableText(
                            meeting.description,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      const HDivider(),
                      Chat(participants: users, meeting: meeting)
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MeetingViewHeader extends StatelessWidget {
  const _MeetingViewHeader({required this.meeting, required this.participants});

  final Meeting meeting;
  final List<UserData> participants;

  static final DateFormat timeFmt = DateFormat.jm();

  @override
  Widget build(BuildContext context) {
    final landscape = MediaQuery.of(context).size.width > 650;
    final textTheme = Theme.of(context).textTheme;
    final host =
        participants.firstWhere((user) => user.uid == meeting.host).email;

    final invitees = participants
        .where((user) => user.uid != meeting.host)
        .map((user) => user.email);

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SelectableText(
                meeting.title,
                style: textTheme.headlineMedium!.copyWith(height: 1.1),
              ),
            ),
            if (!landscape)
              MeetingActionBar(meeting: meeting, participants: participants),
            const SizedBox(width: 20),
            IconButton(
              key: const ValueKey('ReplyExit'),
              icon: const Icon(Icons.keyboard_arrow_down),
              onPressed: () {
                Get.back();
              },
              splashRadius: 20,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SelectableText(
                    'Scheduled by $host at ${DateFormat.yMMMd().format(meeting.start)}'),
                const SizedBox(height: 4),
                SelectableText(
                    'From ${timeFmt.format(meeting.start)} to ${timeFmt.format(meeting.end)}'),
                const SizedBox(height: 4),
                SelectableText(
                  'Invited: ${invitees.join(', ')}',
                  style: textTheme.bodySmall!.copyWith(
                    color: Theme.of(context)
                        .navigationRailTheme
                        .unselectedLabelTextStyle!
                        .color,
                  ),
                ),
              ],
            ),
            if (landscape)
              MeetingActionBar(meeting: meeting, participants: participants),
          ],
        ),
      ],
    );
  }
}
