import 'package:flutter/material.dart';

class SenderAddressRow extends StatefulWidget {
  const SenderAddressRow({super.key, required this.senderEmail});

  final String senderEmail;

  @override
  _SenderAddressRowState createState() => _SenderAddressRowState();
}

class _SenderAddressRowState extends State<SenderAddressRow> {
  late String senderEmail;

  @override
  void initState() {
    super.initState();
    senderEmail = widget.senderEmail;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final accounts = [
      'flutterfan@gmail.com',
      'materialfan@gmail.com',
    ];

    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      onSelected: (email) {
        setState(() {
          senderEmail = email;
        });
      },
      itemBuilder: (context) => <PopupMenuItem<String>>[
        PopupMenuItem<String>(
          value: accounts[0],
          child: Text(
            accounts[0],
            style: textTheme.bodyMedium,
          ),
        ),
        PopupMenuItem<String>(
          value: accounts[1],
          child: Text(
            accounts[1],
            style: textTheme.bodyMedium,
          ),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          top: 16,
          right: 10,
          bottom: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                senderEmail,
                style: textTheme.bodyMedium,
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: theme.colorScheme.onSurface,
            ),
          ],
        ),
      ),
    );
  }
}
