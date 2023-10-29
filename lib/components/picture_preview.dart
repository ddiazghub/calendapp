import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PicturePreview extends StatelessWidget {
  const PicturePreview({super.key});

  bool _shouldShrinkImage() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.android:
        return true;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(end: 4),
            child: Image.asset(
              'reply/attachments/paris_${index + 1}.jpg',
              gaplessPlayback: true,
              package: 'flutter_gallery_assets',
              cacheWidth: _shouldShrinkImage() ? 200 : null,
            ),
          );
        },
      ),
    );
  }
}

