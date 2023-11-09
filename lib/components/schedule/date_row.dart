import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:scheduler_app/components/divider.dart';

class DateTimeRow extends StatelessWidget {
  const DateTimeRow({super.key});

  static const height = 50;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: ReactiveDateTimePicker(
              formControlName: 'date',
              style: theme.textTheme.bodyMedium,
              locale: const Locale('es'),
              dateFormat: DateFormat.yMMMd(),
              decoration: InputDecoration(
                hintText: 'Fecha de la reunión',
                hintStyle: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.primary.withOpacity(0.5),
                ),
                border: InputBorder.none,
                suffixIcon: const Icon(Icons.today),
              ),
            ),
          ),
          const VDivider(height: height),
          const SizedBox(width: 10),
          Expanded(
            child: ReactiveDateTimePicker(
              formControlName: 'start',
              style: theme.textTheme.bodyMedium,
              locale: const Locale('es'),
              type: ReactiveDatePickerFieldType.time,
              dateFormat: DateFormat.jm(),
              decoration: InputDecoration(
                hintText: 'Hora de inicio',
                hintStyle: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.primary.withOpacity(0.5),
                ),
                border: InputBorder.none,
                suffixIcon: const Icon(Icons.timer),
              ),
            ),
          ),
          const VDivider(height: height),
          const SizedBox(width: 10),
          Expanded(
            child: ReactiveDateTimePicker(
              formControlName: 'end',
              style: theme.textTheme.bodyMedium,
              locale: const Locale('es'),
              dateFormat: DateFormat.jm(),
              type: ReactiveDatePickerFieldType.time,
              decoration: InputDecoration(
                hintText: 'Hora de fin',
                hintStyle: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.primary.withOpacity(0.5),
                ),
                border: InputBorder.none,
                suffixIcon: const Icon(Icons.timer),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
