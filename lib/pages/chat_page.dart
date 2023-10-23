import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler_app/components/message_list.dart';
import 'package:scheduler_app/models/message.dart';
import 'package:scheduler_app/services/auth_service.dart';

class ChatPage extends GetView<AuthService> {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // The user can send a message to Firebase. What they can send is
            // protected by server-side security rules, which in this case
            // only allow chat messages that this regular expression:
            //
            //    ^((?i)hello|\\s|firebase|welcome|to|summit|the|this|
            //    everyone|good|morning|afternoon|firestore|meetup|
            //    devfest|virtual|online)+
            //
            // In a real project you'd probably expand that, for example by
            // only allowing users that you explicitly approve to post
            // messages.
            const SizedBox(height: 32),
            Text(
              'Enter a new message',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              'You can type a message into this field and hit the enter key '
              'to add it to the stream. The security rules for the '
              'Firestore database only allow certain words, though! Check '
              'the comments in the code to the left for details.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your message and hit Enter',
                ),
                onSubmitted: (String value) {
                  final message = Message(
                    value,
                    DateTime.now().toUtc(),
                    controller.user!.user.email,
                  );
                  MessageRef.add(message);
                },
              ),
            ),
            // We use a stream builder to both read the initial data from the
            // database and listen to updates to that data in realtime. The
            // database we use is called Firestore, and we are asking the 10
            // most recent messages.
            const SizedBox(height: 32),
            Text(
              'The latest messages',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            const Expanded(child: MessageList()),
          ],
        ),
      ),
    );
  }
}
