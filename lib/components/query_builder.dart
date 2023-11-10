import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:scheduler_app/components/spinner.dart';

typedef BuilderFunction<T> = Widget Function(BuildContext, T);

Widget snapshotBuilder<T>(
  BuildContext context,
  AsyncSnapshot<T> snapshot,
  BuilderFunction<T> builder,
) {
  if (snapshot.hasError) {
    return Center(child: Text('$snapshot.error'));
  } else if (!snapshot.hasData) {
    return const Spinner();
  }

  return builder(context, snapshot.data as T);
}

class QueryBuilder<T> extends StatelessWidget {
  const QueryBuilder({super.key, required this.ref, required this.builder});

  final FirestoreListenable<T> ref;
  final Widget Function(BuildContext, T data) builder;

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<T>(
      ref: ref,
      builder: (context, snapshot, child) {
        return snapshotBuilder(context, snapshot, builder);
      },
    );
  }
}

class StreamingBuilder<T> extends StatelessWidget {
  const StreamingBuilder({
    super.key,
    required this.stream,
    required this.builder,
  });

  final Stream<T> stream;
  final Widget Function(BuildContext, T data) builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return snapshotBuilder(context, snapshot, builder);
      },
    );
  }
}
