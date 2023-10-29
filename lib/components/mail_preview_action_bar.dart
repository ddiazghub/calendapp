import 'package:flutter/material.dart';
import 'package:scheduler_app/colors.dart';
import 'package:scheduler_app/layout/adaptative.dart';
import 'profile_avatar.dart';

const _iconAssetLocation = 'reply/icons';
const _assetsPackage = 'flutter_gallery_assets';

class MailPreviewActionBar extends StatelessWidget {
  const MailPreviewActionBar({super.key, 
    required this.avatar,
    required this.isStarred,
    this.onStar,
    this.onDelete,
  });

  final String avatar;
  final bool isStarred;
  final VoidCallback? onStar;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark ? AppColors.white50 : AppColors.blue600;
    final isDesktop = isDisplayDesktop(context);
    final starredIconColor =
        isStarred ? Theme.of(context).colorScheme.secondary : color;

    return Row(
      children: [
        if (isDesktop) ...[
          IconButton(
            icon: ImageIcon(
              const AssetImage(
                '$_iconAssetLocation/twotone_star.png',
                package: _assetsPackage,
              ),
              color: starredIconColor,
            ),
            onPressed: onStar,
          ),
          IconButton(
            icon: ImageIcon(
              const AssetImage(
                '$_iconAssetLocation/twotone_delete.png',
                package: _assetsPackage,
              ),
              color: color,
            ),
            onPressed: onDelete,
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: color,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 12),
        ],
        ProfileAvatar(avatar: avatar),
      ],
    );
  }
}
