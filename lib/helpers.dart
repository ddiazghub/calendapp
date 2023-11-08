import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

extension DateTimeHash on DateTime {
  int hash() => Object.hash(year, month, day);
  bool equals(DateTime other) => hash() == other.hash();
}

extension IterableExtension<T> on Iterable<T> {
  (List<T>, List<T>) partition(bool Function(T) predicate) {
    List<T> matching = [];
    List<T> notMatching = [];

    for (final element in this) {
      if (predicate(element)) {
        matching.add(element);
      } else {
        notMatching.add(element);
      }
    }

    return (matching, notMatching);
  }

  Map<K, List<T>> groupBy<K>(K Function(T) key) {
    final groups = <K, List<T>>{};

    for (final element in this) {
      final k = key(element);
      groups[k] ??= [];
      groups[k]!.add(element);
    }

    return groups;
  }
}

class FormValidators {
  static final url = Validators.delegate(
      (s) => GetUtils.isURL(s.value) ? null : {'url': true});

  static final dateRange = Validators.delegate((control) {
    final form = control as FormGroup;
    final startControl = form.control('start');
    final endControl = form.control('end');
    final start = startControl.value as DateTime?;
    final end = endControl.value as DateTime?;

    if (start != null && end != null && start.isAfter(end)) {
      startControl.setErrors({'dateRange': true});
      endControl.setErrors({'dateRange': true});
      startControl.markAsTouched();
      endControl.markAsTouched();
    } else {
      startControl.removeError('dateRange');
      endControl.removeError('dateRange');
    }

    return null;
  });
}

class Converters {
  static DateTime localTime(Timestamp time) => time.toDate();
  static Timestamp timestamp(DateTime datetime) => Timestamp.fromDate(datetime);
}

Future<void> deleteDoc(
  BuildContext context,
  FirestoreCollectionReference ref,
  String id,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Confirm Delete'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              ref.doc(id).delete();
              Get.back();
            },
            child: const Text('Confirm'),
          ),
        ],
      );
    },
  );
}
