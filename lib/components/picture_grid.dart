import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PictureGrid extends StatelessWidget {
  const PictureGrid({super.key});

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
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Image.asset(
          'reply/attachments/paris_${index + 1}.jpg',
          gaplessPlayback: true,
          package: 'flutter_gallery_assets',
          fit: BoxFit.fill,
          cacheWidth: _shouldShrinkImage() ? 500 : null,
        );
      },
    );
  }
}
