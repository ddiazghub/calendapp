import 'package:flutter/material.dart';

class RecipientsRow extends StatelessWidget {
  const RecipientsRow({super.key, 
    required this.recipients,
    required this.avatar,
  });

  final String recipients;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Wrap(
              children: [
                Chip(
                  backgroundColor:
                      Theme.of(context).chipTheme.secondarySelectedColor,
                  padding: EdgeInsets.zero,
                  avatar: CircleAvatar(
                    backgroundImage: AssetImage(
                      avatar,
                      package: 'flutter_gallery_assets',
                    ),
                  ),
                  label: Text(
                    recipients,
                  ),
                ),
              ],
            ),
          ),
          InkResponse(
            customBorder: const CircleBorder(),
            onTap: () {},
            radius: 24,
            child: const Icon(Icons.add_circle_outline),
          ),
        ],
      ),
    );
  }
}
