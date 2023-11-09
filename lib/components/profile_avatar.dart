import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.url,
    this.radius = 20,
  });

  final String url;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.white,
        child: ClipOval(
          child: Image.network(
            url,
            gaplessPlayback: true,
            height: 42,
            width: 42,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
