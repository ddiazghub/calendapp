import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler_app/components/query_builder.dart';
import 'package:scheduler_app/models/meeting.dart';
import 'package:scheduler_app/services/auth_service.dart';

class MeetingBuilder<T> extends GetView<AuthService> {
  const MeetingBuilder({super.key, required this.builder});

  final Widget Function(BuildContext, List<Meeting> data) builder;

  @override
  Widget build(BuildContext context) {
    return QueryBuilder(
      ref: MeetingRef.whereHost(isEqualTo: controller.user!.uid),
      builder: (context, snapshot) {
        return QueryBuilder(
          ref: MeetingRef.whereInvitees(arrayContains: controller.user!.uid),
          builder: (context, snapshot2) {
            return builder(
              context,
              [
                for (final doc in snapshot.docs) doc.data,
                for (final doc in snapshot2.docs) doc.data,
              ],
            );
          },
        );
      },
    );
  }
}
