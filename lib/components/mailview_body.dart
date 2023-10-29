import 'package:flutter/material.dart';

class MailViewBody extends StatelessWidget {
  const MailViewBody({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      message,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
    );
  }
}

