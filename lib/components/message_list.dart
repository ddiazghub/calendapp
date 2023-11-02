import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:scheduler_app/components/query_builder.dart';
import 'package:scheduler_app/models/message.dart';
import 'package:scheduler_app/models/user.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key, required this.participants, required this.meetingId});

  final Map<String, UserData> participants;
  final String meetingId;

  ListView buildList(List<MessageQueryDocumentSnapshot> docs) {
    return ListView.separated(
      itemCount: docs.length,
      itemBuilder: (context, i) {
        final message = docs[i].data;
        final user = participants[message.user]?.email ?? 'anonymous';
        final datetime = Moment(message.createdAt).fromNow();
        final contextText = Text('$user $datetime:');

        return Row(
          children: [
            DefaultTextStyle.merge(
              style: const TextStyle(color: Colors.indigo),
              child: contextText,
            ),
            const SizedBox(width: 10),
            Text(message.text)
          ],
        );
      }, separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return QueryBuilder(
      ref: MessageRef.whereMeeting(isEqualTo: meetingId).orderByCreatedAt(descending: true),
      builder: (context, data) {
        return buildList(data.docs);
      },
    );
  }
}
