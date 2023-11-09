import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_awesome_select/reactive_awesome_select.dart';
import 'package:scheduler_app/colors.dart';
import 'package:scheduler_app/components/query_builder.dart';
import 'package:scheduler_app/models/user.dart';
import 'package:scheduler_app/services/auth_service.dart';

class InviteesRow extends GetView<AuthService> {
  InviteesRow({super.key, List<String>? invitees})
      : invitees = invitees?.toSet();

  final Set<String>? invitees;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: QueryBuilder(
        ref: UserRef.whereUid(isNotEqualTo: controller.user!.uid),
        builder: (context, data) {
          final docs = data.docs;
          final choices = [
            for (final doc in docs)
              S2Choice(value: doc.data, title: doc.data.email)
          ];

          return ReactiveSmartSelectMultiple(
            formControlName: 'invitees',
            title: 'Invitados',
            selectedChoice: invitees == null
                ? <S2Choice<UserData>>[]
                : [
                    for (final choice in choices)
                      if (invitees!.contains(choice.value.uid)) choice
                  ],
            modalType: S2ModalType.popupDialog,
            modalFilter: true,
            modalFilterAuto: true,
            choiceLayout: S2ChoiceLayout.wrap,
            modalHeaderStyle: const S2ModalHeaderStyle(
              backgroundColor: Colors.red,
              textStyle: TextStyle(color: Colors.white),
            ),
            modalStyle: S2ModalStyle(
              backgroundColor: theme.colorScheme.secondary,
              shape: const ContinuousRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1),
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
                      'Agregar invitados',
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
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            padding: EdgeInsets.zero,
                            avatar: CircleAvatar(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(user.image),
                            ),
                            label: Text(user.email,
                                style: const TextStyle(color: Colors.white)),
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
              final color = theme.colorScheme.primary;
              final selectedColor = color.lighten(0.4);

              return Card(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                color: choice.selected ? selectedColor : color,
                shape: RoundedRectangleBorder(
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
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(user.image),
                            child: choice.selected
                                ? ClipOval(
                                    child: Container(
                                      color: Colors.green,
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(width: 15),
                          Text(
                            user.email,
                            style: const TextStyle(
                              color: Colors.white,
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
