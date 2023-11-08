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

    final (toStart, ended) =
        meetings.partition((meeting) => meeting.end.isAfter(now));
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Container(
            color: Colors.white,
            child: const TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Color.fromARGB(255, 255, 3, 3),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(1)),
                color: Color.fromARGB(255, 255, 3, 3),
              ),
              tabs: [
                Tab(text: 'REUNIONES PROGRAMADAS'),
                Tab(text: 'REUNIONES PASADAS'),
              ],
            ),
          ),
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
