import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LocationRow extends StatelessWidget {
  const LocationRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 50,
      padding: const EdgeInsets.only(top: 20, left: 28, right: 20),
      child: ReactiveTextField<String>(
        formControlName: 'location',
        textInputAction: TextInputAction.next,
        maxLines: 1,
        autofocus: false,
        style: theme.textTheme.bodyMedium,
        decoration: InputDecoration.collapsed(
          hintText: 'Lugar de reunión',
          hintStyle: theme.textTheme.bodyMedium!.copyWith(
            color: theme.colorScheme.primary.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
