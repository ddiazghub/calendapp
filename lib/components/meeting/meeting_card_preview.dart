import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:scheduler_app/colors.dart';
import 'package:scheduler_app/components/dismissible_container.dart';
import 'package:scheduler_app/components/meeting/meeting_preview.dart';
import 'package:scheduler_app/components/meeting/meeting_view.dart';
import 'package:scheduler_app/components/page/page_view.dart';
import 'package:scheduler_app/layout/adaptative.dart';
import 'package:scheduler_app/models/meeting.dart';

class MeetingPreviewCard extends StatelessWidget {
  const MeetingPreviewCard({
    super.key,
    required this.meeting,
  });

  final Meeting meeting;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OpenContainer(
      openBuilder: (context, closedContainer) {
        return AppView(child: MeetingView(meeting: meeting));
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
        final preview = MeetingPreview(
          meeting: meeting,
          onTap: openContainer,
        );

        if (isDesktop) {
          return preview;
        } else {
          return Dismissible(
            key: ObjectKey(meeting),
            dismissThresholds: const {
              DismissDirection.startToEnd: 0.8,
              DismissDirection.endToStart: 0.4,
            },
            background: DismissibleContainer(
              icon: 'twotone_delete',
              backgroundColor: colorScheme.primary,
              iconColor: AppColors.blue50,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsetsDirectional.only(start: 20),
            ),
            secondaryBackground: DismissibleContainer(
              icon: 'twotone_star',
              backgroundColor: theme.scaffoldBackgroundColor,
              iconColor: colorScheme.onBackground,
              alignment: Alignment.centerRight,
              padding: const EdgeInsetsDirectional.only(end: 20),
            ),
            child: preview,
          );
        }
      },
    );
  }
}
