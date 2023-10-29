import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler_app/components/recipients_row.dart';
import 'package:scheduler_app/components/section_divider.dart';
import 'package:scheduler_app/components/sender_address_row.dart';
import 'package:scheduler_app/components/subject_row.dart';
import 'package:scheduler_app/models/email_store.dart';

class ComposePage extends StatelessWidget {
  const ComposePage({super.key});

  @override
  Widget build(BuildContext context) {
    var senderEmail = 'flutterfan@gmail.com';
    String subject = '';
    String? recipient = 'Recipient';
    String recipientAvatar = 'reply/avatars/avatar_0.jpg';

    final emailStore = Provider.of<EmailStore>(context);

    if (emailStore.selectedEmailId >= 0) {
      final currentEmail = emailStore.currentEmail;
      subject = currentEmail.subject;
      recipient = currentEmail.sender;
      recipientAvatar = currentEmail.avatar;
    }

    return Scaffold(
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
                  SubjectRow(
                    subject: subject,
                  ),
                  const SectionDivider(),
                  SenderAddressRow(
                    senderEmail: senderEmail,
                  ),
                  const SectionDivider(),
                  RecipientsRow(
                    recipients: recipient,
                    avatar: recipientAvatar,
                  ),
                  const SectionDivider(),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      minLines: 6,
                      maxLines: 20,
                      decoration: const InputDecoration.collapsed(
                        hintText: 'New Message...',
                      ),
                      autofocus: false,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
