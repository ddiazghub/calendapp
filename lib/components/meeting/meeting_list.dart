import 'package:flutter/material.dart';
import 'package:scheduler_app/components/meeting/meeting_card_preview.dart';
import 'package:scheduler_app/layout/adaptative.dart';
import 'package:scheduler_app/models/meeting.dart';

class MeetingList extends StatelessWidget {
  const MeetingList({super.key, required this.meetings});

  final List<Meeting> meetings;

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    final isTablet = isDisplaySmallDesktop(context);

    final startPadding = isTablet
        ? 60.0
        : isDesktop
            ? 120.0
            : 4.0;

    final endPadding = isTablet
        ? 30.0
        : isDesktop
            ? 60.0
            : 4.0;

    if (meetings.isEmpty) {
      return const Center(child: Text('No meetings found'));
    } else {
      return ListView.separated(
        itemCount: meetings.length,
        padding: EdgeInsetsDirectional.only(
          start: startPadding,
          end: endPadding,
          top: isDesktop ? 28 : 0,
          bottom: kToolbarHeight,
        ),
        primary: false,
        separatorBuilder: (context, index) => const SizedBox(height: 4),
        itemBuilder: (context, index) {
          return MeetingPreviewCard(meeting: meetings[index]);
        },
      );
    }
  }
}
