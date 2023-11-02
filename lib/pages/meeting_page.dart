import 'package:flutter/material.dart';
import 'package:scheduler_app/components/auth_redirects.dart';
import 'package:scheduler_app/components/meeting/meeting_builder.dart';
import 'package:scheduler_app/components/meeting/meeting_list.dart';
import 'package:get/get.dart';
import 'package:scheduler_app/components/page/page_view.dart';
import 'package:scheduler_app/helpers.dart';
import 'package:scheduler_app/models/meeting.dart';
import 'package:scheduler_app/routes.dart';
import 'package:scheduler_app/services/meeting_service.dart';

class MeetingPage extends GetView<MeetingService> {
  const MeetingPage({super.key});

  Widget buildBody(BuildContext context, List<Meeting> meetings) {
    final now = DateTime.now();
    controller.meetings = meetings;

    final (toStart, ended) = meetings.partition((meeting) => meeting.end.isAfter(now));

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const TabBar(
          tabs: [
            Tab(text: 'Scheduled Meetings'),
            Tab(text: 'Past Meetings'),
          ],
        ),
        body: TabBarView(
          children: [
            SafeArea(bottom: false, child: MeetingList(meetings: toStart)),
            SafeArea(bottom: false, child: MeetingList(meetings: ended)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RequiresAuth(
      builder: (context, session) {
        return AppView(
          currentTab: NavigationTab.home,
          child: MeetingBuilder(
            builder: buildBody,
          ),
        );
      },
    );
  }
}
