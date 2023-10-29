import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler_app/components/mail_preview_action_bar.dart';
import 'package:scheduler_app/models/email_store.dart';
import 'picture_preview.dart';
import 'package:scheduler_app/models/email_model.dart';

class MailPreview extends StatelessWidget {
  const MailPreview({super.key, 
    required this.id,
    required this.email,
    required this.onTap,
    this.onStar,
    this.onDelete,
  });

  final int id;
  final Email email;
  final VoidCallback onTap;
  final VoidCallback? onStar;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var emailStore = Provider.of<EmailStore>(
      context,
      listen: false,
    );

    return InkWell(
      onTap: () {
        Provider.of<EmailStore>(
          context,
          listen: false,
        ).selectedEmailId = id;
        onTap();
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${email.sender} - ${email.time}',
                              style: textTheme.bodySmall,
                            ),
                            const SizedBox(height: 4),
                            Text(email.subject, style: textTheme.headlineSmall),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                      MailPreviewActionBar(
                        avatar: email.avatar,
                        isStarred: emailStore.isEmailStarred(email.id),
                        onStar: onStar,
                        onDelete: onDelete,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: 20,
                    ),
                    child: Text(
                      email.message,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: textTheme.bodyMedium,
                    ),
                  ),
                  if (email.containsPictures) ...[
                    const Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          PicturePreview(),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
