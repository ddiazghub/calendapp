import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:scheduler_app/colors.dart';
import 'package:scheduler_app/components/dismissible_container.dart';
import 'package:scheduler_app/components/mail_preview.dart';
import 'package:scheduler_app/layout/adaptative.dart';
import 'package:scheduler_app/pages/mail_view_page.dart';
import 'package:scheduler_app/models/email_model.dart';

class MailPreviewCard extends StatelessWidget {
  const MailPreviewCard({
    super.key,
    required this.id,
    required this.email,
    required this.onDelete,
    required this.onStar,
    required this.isStarred,
    required this.onStarredMailbox,
  });

  final int id;
  final Email email;
  final VoidCallback onDelete;
  final VoidCallback onStar;
  final bool isStarred;
  final bool onStarredMailbox;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // TODO(x): State restoration of mail view page is blocked because OpenContainer does not support restorablePush, https://github.com/flutter/gallery/issues/570.
    return OpenContainer(
      openBuilder: (context, closedContainer) {
        return MailViewPage(id: id, email: email);
      },
      openColor: theme.cardColor,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      closedElevation: 0,
      closedColor: theme.cardColor,
      closedBuilder: (context, openContainer) {
        final isDesktop = isDisplayDesktop(context);
        final colorScheme = theme.colorScheme;
        final mailPreview = MailPreview(
          id: id,
          email: email,
          onTap: openContainer,
          onStar: onStar,
          onDelete: onDelete,
        );

        if (isDesktop) {
          return mailPreview;
        } else {
          return Dismissible(
            key: ObjectKey(email),
            dismissThresholds: const {
              DismissDirection.startToEnd: 0.8,
              DismissDirection.endToStart: 0.4,
            },
            onDismissed: (direction) {
              switch (direction) {
                case DismissDirection.endToStart:
                  if (onStarredMailbox) {
                    onStar();
                  }
                  break;
                case DismissDirection.startToEnd:
                  onDelete();
                  break;
                default:
              }
            },
            background: DismissibleContainer(
              icon: 'twotone_delete',
              backgroundColor: colorScheme.primary,
              iconColor: AppColors.blue50,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsetsDirectional.only(start: 20),
            ),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                if (onStarredMailbox) {
                  return true;
                }
                onStar();
                return false;
              } else {
                return true;
              }
            },
            secondaryBackground: DismissibleContainer(
              icon: 'twotone_star',
              backgroundColor: isStarred
                  ? colorScheme.secondary
                  : theme.scaffoldBackgroundColor,
              iconColor: isStarred
                  ? colorScheme.onSecondary
                  : colorScheme.onBackground,
              alignment: Alignment.centerRight,
              padding: const EdgeInsetsDirectional.only(end: 20),
            ),
            child: mailPreview,
          );
        }
      },
    );
  }
}
