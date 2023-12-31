// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters, duplicate_ignore
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_internal_member

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class MessageCollectionReference
    implements
        MessageQuery,
        FirestoreCollectionReference<Message, MessageQuerySnapshot> {
  factory MessageCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$MessageCollectionReference;

  static Message fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Message.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Message value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<Message> get reference;

  @override
  MessageDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<MessageDocumentReference> add(Message value);
}

class _$MessageCollectionReference extends _$MessageQuery
    implements MessageCollectionReference {
  factory _$MessageCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$MessageCollectionReference._(
      firestore.collection('messages').withConverter(
            fromFirestore: MessageCollectionReference.fromFirestore,
            toFirestore: MessageCollectionReference.toFirestore,
          ),
    );
  }

  _$MessageCollectionReference._(
    CollectionReference<Message> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Message> get reference =>
      super.reference as CollectionReference<Message>;

  @override
  MessageDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return MessageDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<MessageDocumentReference> add(Message value) {
    return reference.add(value).then((ref) => MessageDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$MessageCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class MessageDocumentReference
    extends FirestoreDocumentReference<Message, MessageDocumentSnapshot> {
  factory MessageDocumentReference(DocumentReference<Message> reference) =
      _$MessageDocumentReference;

  DocumentReference<Message> get reference;

  /// A reference to the [MessageCollectionReference] containing this document.
  MessageCollectionReference get parent {
    return _$MessageCollectionReference(reference.firestore);
  }

  @override
  Stream<MessageDocumentSnapshot> snapshots();

  @override
  Future<MessageDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    DateTime createdAt,
    FieldValue createdAtFieldValue,
    String text,
    FieldValue textFieldValue,
    String user,
    FieldValue userFieldValue,
    String meeting,
    FieldValue meetingFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    DateTime createdAt,
    FieldValue createdAtFieldValue,
    String text,
    FieldValue textFieldValue,
    String user,
    FieldValue userFieldValue,
    String meeting,
    FieldValue meetingFieldValue,
  });
}

class _$MessageDocumentReference
    extends FirestoreDocumentReference<Message, MessageDocumentSnapshot>
    implements MessageDocumentReference {
  _$MessageDocumentReference(this.reference);

  @override
  final DocumentReference<Message> reference;

  /// A reference to the [MessageCollectionReference] containing this document.
  MessageCollectionReference get parent {
    return _$MessageCollectionReference(reference.firestore);
  }

  @override
  Stream<MessageDocumentSnapshot> snapshots() {
    return reference.snapshots().map(MessageDocumentSnapshot._);
  }

  @override
  Future<MessageDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(MessageDocumentSnapshot._);
  }

  @override
  Future<MessageDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(MessageDocumentSnapshot._);
  }

  Future<void> update({
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? text = _sentinel,
    FieldValue? textFieldValue,
    Object? user = _sentinel,
    FieldValue? userFieldValue,
    Object? meeting = _sentinel,
    FieldValue? meetingFieldValue,
  }) async {
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      text == _sentinel || textFieldValue == null,
      "Cannot specify both text and textFieldValue",
    );
    assert(
      user == _sentinel || userFieldValue == null,
      "Cannot specify both user and userFieldValue",
    );
    assert(
      meeting == _sentinel || meetingFieldValue == null,
      "Cannot specify both meeting and meetingFieldValue",
    );
    final json = {
      if (createdAt != _sentinel)
        _$MessageFieldMap['createdAt']!:
            _$MessagePerFieldToJson.createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$MessageFieldMap['createdAt']!: createdAtFieldValue,
      if (text != _sentinel)
        _$MessageFieldMap['text']!:
            _$MessagePerFieldToJson.text(text as String),
      if (textFieldValue != null) _$MessageFieldMap['text']!: textFieldValue,
      if (user != _sentinel)
        _$MessageFieldMap['user']!:
            _$MessagePerFieldToJson.user(user as String),
      if (userFieldValue != null) _$MessageFieldMap['user']!: userFieldValue,
      if (meeting != _sentinel)
        _$MessageFieldMap['meeting']!:
            _$MessagePerFieldToJson.meeting(meeting as String),
      if (meetingFieldValue != null)
        _$MessageFieldMap['meeting']!: meetingFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? text = _sentinel,
    FieldValue? textFieldValue,
    Object? user = _sentinel,
    FieldValue? userFieldValue,
    Object? meeting = _sentinel,
    FieldValue? meetingFieldValue,
  }) {
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      text == _sentinel || textFieldValue == null,
      "Cannot specify both text and textFieldValue",
    );
    assert(
      user == _sentinel || userFieldValue == null,
      "Cannot specify both user and userFieldValue",
    );
    assert(
      meeting == _sentinel || meetingFieldValue == null,
      "Cannot specify both meeting and meetingFieldValue",
    );
    final json = {
      if (createdAt != _sentinel)
        _$MessageFieldMap['createdAt']!:
            _$MessagePerFieldToJson.createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$MessageFieldMap['createdAt']!: createdAtFieldValue,
      if (text != _sentinel)
        _$MessageFieldMap['text']!:
            _$MessagePerFieldToJson.text(text as String),
      if (textFieldValue != null) _$MessageFieldMap['text']!: textFieldValue,
      if (user != _sentinel)
        _$MessageFieldMap['user']!:
            _$MessagePerFieldToJson.user(user as String),
      if (userFieldValue != null) _$MessageFieldMap['user']!: userFieldValue,
      if (meeting != _sentinel)
        _$MessageFieldMap['meeting']!:
            _$MessagePerFieldToJson.meeting(meeting as String),
      if (meetingFieldValue != null)
        _$MessageFieldMap['meeting']!: meetingFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is MessageDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class MessageQuery
    implements QueryReference<Message, MessageQuerySnapshot> {
  @override
  MessageQuery limit(int limit);

  @override
  MessageQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  MessageQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  MessageQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  MessageQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  MessageQuery whereCreatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  });
  MessageQuery whereText({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  MessageQuery whereUser({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  MessageQuery whereMeeting({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  MessageQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  });

  MessageQuery orderByCreatedAt({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  });

  MessageQuery orderByText({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  });

  MessageQuery orderByUser({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  });

  MessageQuery orderByMeeting({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  });
}

class _$MessageQuery extends QueryReference<Message, MessageQuerySnapshot>
    implements MessageQuery {
  _$MessageQuery(
    this._collection, {
    required Query<Message> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<MessageQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(MessageQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<MessageQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(MessageQuerySnapshot._fromQuerySnapshot);
  }

  @override
  MessageQuery limit(int limit) {
    return _$MessageQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MessageQuery limitToLast(int limit) {
    return _$MessageQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  MessageQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$MessageQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  MessageQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo = notSetQueryParam,
    Object? isNotEqualTo = notSetQueryParam,
    Object? isLessThan = notSetQueryParam,
    Object? isLessThanOrEqualTo = notSetQueryParam,
    Object? isGreaterThan = notSetQueryParam,
    Object? isGreaterThanOrEqualTo = notSetQueryParam,
    Object? arrayContains = notSetQueryParam,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$MessageQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  MessageQuery whereDocumentId({
    Object? isEqualTo = notSetQueryParam,
    Object? isNotEqualTo = notSetQueryParam,
    Object? isLessThan = notSetQueryParam,
    Object? isLessThanOrEqualTo = notSetQueryParam,
    Object? isGreaterThan = notSetQueryParam,
    Object? isGreaterThanOrEqualTo = notSetQueryParam,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$MessageQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  MessageQuery whereCreatedAt({
    Object? isEqualTo = notSetQueryParam,
    Object? isNotEqualTo = notSetQueryParam,
    Object? isLessThan = notSetQueryParam,
    Object? isLessThanOrEqualTo = notSetQueryParam,
    Object? isGreaterThan = notSetQueryParam,
    Object? isGreaterThanOrEqualTo = notSetQueryParam,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  }) {
    return _$MessageQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MessageFieldMap['createdAt']!,
        isEqualTo: isEqualTo != notSetQueryParam
            ? _$MessagePerFieldToJson.createdAt(isEqualTo as DateTime)
            : notSetQueryParam,
        isNotEqualTo: isNotEqualTo != notSetQueryParam
            ? _$MessagePerFieldToJson.createdAt(isNotEqualTo as DateTime)
            : notSetQueryParam,
        isLessThan: isLessThan != notSetQueryParam
            ? _$MessagePerFieldToJson.createdAt(isLessThan as DateTime)
            : notSetQueryParam,
        isLessThanOrEqualTo: isLessThanOrEqualTo != notSetQueryParam
            ? _$MessagePerFieldToJson.createdAt(isLessThanOrEqualTo as DateTime)
            : notSetQueryParam,
        isGreaterThan: isGreaterThan != notSetQueryParam
            ? _$MessagePerFieldToJson.createdAt(isGreaterThan as DateTime)
            : notSetQueryParam,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != notSetQueryParam
            ? _$MessagePerFieldToJson
                .createdAt(isGreaterThanOrEqualTo as DateTime)
            : notSetQueryParam,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MessagePerFieldToJson.createdAt(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$MessagePerFieldToJson.createdAt(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  MessageQuery whereText({
    Object? isEqualTo = notSetQueryParam,
    Object? isNotEqualTo = notSetQueryParam,
    Object? isLessThan = notSetQueryParam,
    Object? isLessThanOrEqualTo = notSetQueryParam,
    Object? isGreaterThan = notSetQueryParam,
    Object? isGreaterThanOrEqualTo = notSetQueryParam,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$MessageQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MessageFieldMap['text']!,
        isEqualTo: isEqualTo != notSetQueryParam
            ? _$MessagePerFieldToJson.text(isEqualTo as String)
            : notSetQueryParam,
        isNotEqualTo: isNotEqualTo != notSetQueryParam
            ? _$MessagePerFieldToJson.text(isNotEqualTo as String)
            : notSetQueryParam,
        isLessThan: isLessThan != notSetQueryParam
            ? _$MessagePerFieldToJson.text(isLessThan as String)
            : notSetQueryParam,
        isLessThanOrEqualTo: isLessThanOrEqualTo != notSetQueryParam
            ? _$MessagePerFieldToJson.text(isLessThanOrEqualTo as String)
            : notSetQueryParam,
        isGreaterThan: isGreaterThan != notSetQueryParam
            ? _$MessagePerFieldToJson.text(isGreaterThan as String)
            : notSetQueryParam,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != notSetQueryParam
            ? _$MessagePerFieldToJson.text(isGreaterThanOrEqualTo as String)
            : notSetQueryParam,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MessagePerFieldToJson.text(e)),
        whereNotIn: whereNotIn?.map((e) => _$MessagePerFieldToJson.text(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  MessageQuery whereUser({
    Object? isEqualTo = notSetQueryParam,
    Object? isNotEqualTo = notSetQueryParam,
    Object? isLessThan = notSetQueryParam,
    Object? isLessThanOrEqualTo = notSetQueryParam,
    Object? isGreaterThan = notSetQueryParam,
    Object? isGreaterThanOrEqualTo = notSetQueryParam,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$MessageQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MessageFieldMap['user']!,
        isEqualTo: isEqualTo != notSetQueryParam
            ? _$MessagePerFieldToJson.user(isEqualTo as String)
            : notSetQueryParam,
        isNotEqualTo: isNotEqualTo != notSetQueryParam
            ? _$MessagePerFieldToJson.user(isNotEqualTo as String)
            : notSetQueryParam,
        isLessThan: isLessThan != notSetQueryParam
            ? _$MessagePerFieldToJson.user(isLessThan as String)
            : notSetQueryParam,
        isLessThanOrEqualTo: isLessThanOrEqualTo != notSetQueryParam
            ? _$MessagePerFieldToJson.user(isLessThanOrEqualTo as String)
            : notSetQueryParam,
        isGreaterThan: isGreaterThan != notSetQueryParam
            ? _$MessagePerFieldToJson.user(isGreaterThan as String)
            : notSetQueryParam,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != notSetQueryParam
            ? _$MessagePerFieldToJson.user(isGreaterThanOrEqualTo as String)
            : notSetQueryParam,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MessagePerFieldToJson.user(e)),
        whereNotIn: whereNotIn?.map((e) => _$MessagePerFieldToJson.user(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  MessageQuery whereMeeting({
    Object? isEqualTo = notSetQueryParam,
    Object? isNotEqualTo = notSetQueryParam,
    Object? isLessThan = notSetQueryParam,
    Object? isLessThanOrEqualTo = notSetQueryParam,
    Object? isGreaterThan = notSetQueryParam,
    Object? isGreaterThanOrEqualTo = notSetQueryParam,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$MessageQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MessageFieldMap['meeting']!,
        isEqualTo: isEqualTo != notSetQueryParam
            ? _$MessagePerFieldToJson.meeting(isEqualTo as String)
            : notSetQueryParam,
        isNotEqualTo: isNotEqualTo != notSetQueryParam
            ? _$MessagePerFieldToJson.meeting(isNotEqualTo as String)
            : notSetQueryParam,
        isLessThan: isLessThan != notSetQueryParam
            ? _$MessagePerFieldToJson.meeting(isLessThan as String)
            : notSetQueryParam,
        isLessThanOrEqualTo: isLessThanOrEqualTo != notSetQueryParam
            ? _$MessagePerFieldToJson.meeting(isLessThanOrEqualTo as String)
            : notSetQueryParam,
        isGreaterThan: isGreaterThan != notSetQueryParam
            ? _$MessagePerFieldToJson.meeting(isGreaterThan as String)
            : notSetQueryParam,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != notSetQueryParam
            ? _$MessagePerFieldToJson.meeting(isGreaterThanOrEqualTo as String)
            : notSetQueryParam,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MessagePerFieldToJson.meeting(e)),
        whereNotIn: whereNotIn?.map((e) => _$MessagePerFieldToJson.meeting(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  MessageQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$MessageQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  MessageQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$MessageFieldMap['createdAt']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$MessageQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  MessageQuery orderByText({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$MessageFieldMap['text']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$MessageQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  MessageQuery orderByUser({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$MessageFieldMap['user']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$MessageQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  MessageQuery orderByMeeting({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$MessageFieldMap['meeting']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$MessageQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$MessageQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class MessageDocumentSnapshot extends FirestoreDocumentSnapshot<Message> {
  MessageDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Message> snapshot;

  @override
  MessageDocumentReference get reference {
    return MessageDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Message? data;
}

class MessageQuerySnapshot
    extends FirestoreQuerySnapshot<Message, MessageQueryDocumentSnapshot> {
  MessageQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory MessageQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Message> snapshot,
  ) {
    final docs = snapshot.docs.map(MessageQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        MessageDocumentSnapshot._,
      );
    }).toList();

    return MessageQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<MessageDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    MessageDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<MessageDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Message> snapshot;

  @override
  final List<MessageQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<MessageDocumentSnapshot>> docChanges;
}

class MessageQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Message>
    implements MessageDocumentSnapshot {
  MessageQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Message> snapshot;

  @override
  final Message data;

  @override
  MessageDocumentReference get reference {
    return MessageDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      json['text'] as String,
      json['user'] as String,
      json['meeting'] as String,
      Converters.localTime(json['createdAt'] as Timestamp),
    );

const _$MessageFieldMap = <String, String>{
  'createdAt': 'createdAt',
  'text': 'text',
  'user': 'user',
  'meeting': 'meeting',
};

// ignore: unused_element
abstract class _$MessagePerFieldToJson {
  // ignore: unused_element
  static Object? createdAt(DateTime instance) => Converters.timestamp(instance);
  // ignore: unused_element
  static Object? text(String instance) => instance;
  // ignore: unused_element
  static Object? user(String instance) => instance;
  // ignore: unused_element
  static Object? meeting(String instance) => instance;
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'createdAt': Converters.timestamp(instance.createdAt),
      'text': instance.text,
      'user': instance.user,
      'meeting': instance.meeting,
    };
