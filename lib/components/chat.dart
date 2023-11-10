import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler_app/components/message_list.dart';
import 'package:scheduler_app/models/meeting.dart';
import 'package:scheduler_app/models/message.dart';
import 'package:scheduler_app/models/user.dart';
import 'package:scheduler_app/services/auth_service.dart';

class Chat extends GetView<AuthService> {
  Chat({super.key, required List<UserData> participants, required this.meeting}) {
    this.participants = {for (var user in participants) user.uid: user};
  }

  late final Map<String, UserData> participants;
  final Meeting meeting;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            'Chat',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          FractionallySizedBox(
            widthFactor: 1,
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Enter your message and hit Enter',
                hintStyle: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.primary.withOpacity(0.5),
                ),
              ),
              onSubmitted: (String value) {
                final message = Message(
                  value,
                  controller.user!.uid,
                  meeting.id,
                  DateTime.now(),
                );
                MessageRef.add(message);
              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: MessageList(
              participants: participants,
              meetingId: meeting.id,
            ),
          ),
        ],
      ),
    );
  }
}
