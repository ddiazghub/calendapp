import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: ReactiveTextField(
        formControlName: 'description',
        minLines: 6,
        maxLines: 20,
        decoration: InputDecoration.collapsed(
          hintText: 'Description',
          hintStyle: theme.textTheme.bodyMedium!
              .copyWith(color: theme.colorScheme.primary.withOpacity(0.5)),
        ),
        autofocus: false,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
