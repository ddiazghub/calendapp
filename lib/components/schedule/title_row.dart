import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({super.key, required this.form});

  final FormGroup form;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50, width: 25),
          Expanded(
            child: ReactiveTextField<String>(
              formControlName: 'title',
              textInputAction: TextInputAction.next,
              maxLines: 1,
              autofocus: false,
              style: theme.textTheme.titleLarge,
              onSubmitted: (field) => form.focus('date'),
              decoration: InputDecoration.collapsed(
                hintText: 'Title',
                hintStyle: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.primary.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
