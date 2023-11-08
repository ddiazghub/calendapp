import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_awesome_select/reactive_awesome_select.dart';
import 'package:scheduler_app/colors.dart';
import 'package:scheduler_app/components/query_builder.dart';
import 'package:scheduler_app/models/user.dart';
import 'package:scheduler_app/services/auth_service.dart';

class InviteesRow extends GetView<AuthService> {
  const InviteesRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = theme.primaryColor.lighten(0.3);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: QueryBuilder(
        ref: UserRef.whereUid(isNotEqualTo: controller.user!.uid),
        builder: (context, data) {
          final docs = data.docs;

          return ReactiveSmartSelectMultiple(
            formControlName: 'invitees',
            title: 'Invitees',
            modalType: S2ModalType.popupDialog,
            modalFilter: true,
            modalFilterAuto: true,
            choiceLayout: S2ChoiceLayout.wrap,
            modalStyle: S2ModalStyle(
              backgroundColor: theme.primaryColor.lighten(0.02),
              shape: ContinuousRectangleBorder(
                side: BorderSide(color: borderColor, width: 1),
              ),
            ),
            choiceItems: [
              for (final doc in docs)
                S2Choice(value: doc.data, title: doc.data.email)
            ],
            tileBuilder: (context, state) {
              final selected = state.selected.value;

              final title = selected.isEmpty
                  ? Text(
                      'Invite people',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.primary.withOpacity(0.5),
                      ),
                    )
                  : Wrap(
                      spacing: 10,
                      runSpacing: 20,
                      children: selected.map(
                        (user) {
                          return Chip(
                            backgroundColor: Theme.of(context)
                                .chipTheme
                                .secondarySelectedColor,
                            padding: EdgeInsets.zero,
                            avatar: CircleAvatar(
                              backgroundImage: NetworkImage(user.image),
                            ),
                            label: Text(user.email),
                          );
                        },
                      ).toList(),
                    );

              return S2Tile.fromState(
                state,
                title: title,
                value: const Text(''),
                trailing: const Icon(Icons.arrow_drop_down),
              );
            },
            choiceBuilder: (context, state, choice) {
              final user = choice.value;

              return Card(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                color: choice.selected
                    ? theme.primaryColor.lighten(0.1)
                    : theme.cardColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: borderColor),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: InkWell(
                  onTap: () => choice.select!(!choice.selected),
                  child: SizedBox(
                    height: 70,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 40),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(user.image),
                            child: choice.selected
                                ? const Icon(
                                    Icons.check_outlined,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            user.email,
                            style: TextStyle(
                              color: choice.selected ? Colors.white : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
