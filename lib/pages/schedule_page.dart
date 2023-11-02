import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:scheduler_app/components/auth_redirects.dart';
import 'package:scheduler_app/components/page/page_view.dart';
import 'package:scheduler_app/components/schedule/date_row.dart';
import 'package:scheduler_app/components/schedule/description_field.dart';
import 'package:scheduler_app/components/schedule/invitees_row.dart';
import 'package:scheduler_app/components/schedule/location_row.dart';
import 'package:scheduler_app/components/schedule/title_row.dart';
import 'package:scheduler_app/components/divider.dart';
import 'package:scheduler_app/helpers.dart';
import 'package:scheduler_app/models/meeting.dart';
import 'package:scheduler_app/models/user.dart';
import 'package:scheduler_app/routes.dart';
import 'package:scheduler_app/services/auth_service.dart';
import 'package:scheduler_app/services/meeting_service.dart';

class SchedulePage extends GetView<MeetingService> {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final meeting = Get.arguments is Meeting ? Get.arguments as Meeting : null;

    FormGroup buildForm() {
      return fb.group(
        {
          'title': [meeting?.title ?? '', Validators.required],
          'description': [meeting?.description ?? ''],
          'location': [meeting?.location ?? '', Validators.required],
          'invitees': FormControl<List<UserData>>(
            value: [],
            validators: [Validators.required, Validators.minLength(1)],
          ),
          'date': FormControl(
            value: meeting?.start.copyWith(hour: 0, minute: 0, second: 0),
            validators: [Validators.required],
          ),
          'start': FormControl(
            value: meeting?.start,
            validators: [Validators.required],
          ),
          'end': FormControl(
            value: meeting?.end,
            validators: [Validators.required],
          ),
        },
        [FormValidators.dateRange],
      );
    }

    return RequiresAuth(
      builder: (context, session) {
        return AppView(
          currentTab: NavigationTab.schedule,
          child: ReactiveFormBuilder(
            form: buildForm,
            builder: (context, form, child) {
              return Scaffold(
                floatingActionButton: FloatingActionButton.extended(
                  heroTag: 'confirm',
                  label: const Text('Confirm'),
                  icon: const Icon(Icons.check),
                  onPressed: () {
                    if (form.valid) {
                      final DateTime date = form.control('date').value;
                      final DateTime startTime = form.control('start').value;
                      final DateTime endTime = form.control('end').value;
                      final String title = form.control('title').value;
                      final String description = form.control('description').value ?? '';
                      final String location = form.control('location').value;
                      final List<UserData> inv = form.control('invitees').value;
                      final List<String> invitees = inv.map((user) => user.uid).toList();
                      final DateTime start = date.copyWith(
                        hour: startTime.hour,
                        minute: startTime.minute,
                      );
                      final DateTime end = date.copyWith(
                        hour: endTime.hour,
                        minute: endTime.minute,
                      );

                      if (meeting == null) {
                        Meeting newMeeting = Meeting(
                          title,
                          description,
                          Get.find<AuthService>().user!.uid,
                          location,
                          invitees,
                          start,
                          end,
                          DateTime.now(),
                        );

                        MeetingRef.add(newMeeting);
                      } else {
                        MeetingRef.doc(meeting.id).update(
                          title: title,
                          description: description,
                          location: location,
                          invitees: invitees,
                          start: start,
                          end: end,
                        );
                      }

                      Get.offNamed(Routes.home);
                    } else {
                      form.markAllAsTouched();
                    }
                  },
                ),
                body: SafeArea(
                  bottom: false,
                  child: SizedBox(
                    height: double.infinity,
                    child: Material(
                      color: Theme.of(context).cardColor,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TitleRow(form: form),
                            const HDivider(),
                            const DateTimeRow(),
                            const HDivider(),
                            const InviteesRow(),
                            const HDivider(),
                            const LocationRow(),
                            const HDivider(),
                            const DescriptionField(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
