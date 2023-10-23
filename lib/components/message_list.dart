import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scheduler_app/models/message.dart';

import 'spinner.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key});

  static final DateFormat fmt = DateFormat('y/MM/dd HH:mm:SS');
  static const messageLimit = 30;


  ListView buildList(List<MessageQueryDocumentSnapshot> docs) {
    return ListView.builder(
      itemCount: docs.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: DefaultTextStyle.merge(
            style: const TextStyle(color: Colors.indigo),
            child: Text(fmt.format(docs[i].data.createdAt)),
          ),
          title: Text(docs[i].data.text),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<MessageQuerySnapshot>(
      ref: MessageRef.orderByCreatedAt(descending: true).limit(messageLimit),
      builder: (context, snapshot, child) {
        if (snapshot.hasError) {
          return Center(child: Text('$snapshot.error'));
        } else if (!snapshot.hasData) {
          return const Spinner();
        }

        return buildList(snapshot.data!.docs);
      },
    );
  }
}
