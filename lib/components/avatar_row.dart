import 'package:flutter/material.dart';
import 'package:scheduler_app/components/profile_avatar.dart';
import 'package:scheduler_app/models/user.dart';

class AvatarRow extends StatelessWidget {
  const AvatarRow({super.key, required this.users});

  final Iterable<UserData> users;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      constraints: BoxConstraints(
        minWidth: 50,
        maxWidth: width < 600 ? width * 0.15 : width < 800 ? width * 0.25 : width * 0.5,
      ),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 10,
        clipBehavior: Clip.hardEdge,
        children: [
          for (final user in users)
            Tooltip(
              message: user.email,
              child: ProfileAvatar(url: user.image),
            ),
        ],
      ),
    );
  }
}
