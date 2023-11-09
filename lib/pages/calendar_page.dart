import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:scheduler_app/components/auth_redirects.dart';
import 'package:scheduler_app/components/meeting/meeting_builder.dart';
import 'package:scheduler_app/components/meeting/meeting_list.dart';
import 'package:get/get.dart';
import 'package:scheduler_app/components/page/page_view.dart';
import 'package:scheduler_app/helpers.dart';
import 'package:scheduler_app/models/meeting.dart';
import 'package:scheduler_app/routes.dart';
import 'package:scheduler_app/services/meeting_service.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends GetView<MeetingService> {
  const CalendarPage({super.key});

  Widget buildBody(BuildContext context, List<Meeting> data) {
    final CalendarController calendar = Get.find();
    controller.meetings = data;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      calendar.date = Get.arguments ?? DateTime.now();
    });

    return SafeArea(
      bottom: false,
      child: Obx(
        () {
          final meetings = data.groupBy((meeting) => meeting.start.hash());
          final todayMeetings = meetings[calendar.date.hash()] ?? [];

          return Column(
            children: [
              TableCalendar(
                firstDay: DateTime(1970, 1, 2),
                lastDay: DateTime(2038, 1, 18),
                focusedDay: calendar.date,
                eventLoader: (day) => meetings[day.hash()]?.map((e) => e.title).toList() ?? [],
                selectedDayPredicate: (day) => day.isAtSameDayAs(calendar.date),
                onDaySelected: (selected, focused) {
                  calendar.date = selected;
                },
              ),
              const SizedBox(height: 8.0),
              Expanded(child: MeetingList(meetings: todayMeetings)),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RequiresAuth(
      builder: (context) {
        return AppView(
          currentTab: NavigationTab.calendar,
          child: MeetingBuilder(
            builder: buildBody,
          ),
        );
      },
    );
  }
}

class CalendarController extends GetxController {
  final _date = DateTime.now().obs;

  DateTime get date => _date.value;

  set date(DateTime value) => _date.value = value;
}
