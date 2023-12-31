// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting.dart';

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
abstract class MeetingCollectionReference
    implements
        MeetingQuery,
        FirestoreCollectionReference<Meeting, MeetingQuerySnapshot> {
  factory MeetingCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$MeetingCollectionReference;

  static Meeting fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Meeting.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Meeting value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<Meeting> get reference;

  @override
  MeetingDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<MeetingDocumentReference> add(Meeting value);
}

class _$MeetingCollectionReference extends _$MeetingQuery
    implements MeetingCollectionReference {
  factory _$MeetingCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$MeetingCollectionReference._(
      firestore.collection('meetings').withConverter(
            fromFirestore: MeetingCollectionReference.fromFirestore,
            toFirestore: MeetingCollectionReference.toFirestore,
          ),
    );
  }

  _$MeetingCollectionReference._(
    CollectionReference<Meeting> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Meeting> get reference =>
      super.reference as CollectionReference<Meeting>;

  @override
  MeetingDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return MeetingDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<MeetingDocumentReference> add(Meeting value) {
    return reference.add(value).then((ref) => MeetingDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$MeetingCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class MeetingDocumentReference
    extends FirestoreDocumentReference<Meeting, MeetingDocumentSnapshot> {
  factory MeetingDocumentReference(DocumentReference<Meeting> reference) =
      _$MeetingDocumentReference;

  DocumentReference<Meeting> get reference;

  /// A reference to the [MeetingCollectionReference] containing this document.
  MeetingCollectionReference get parent {
    return _$MeetingCollectionReference(reference.firestore);
  }

  @override
  Stream<MeetingDocumentSnapshot> snapshots();

  @override
  Future<MeetingDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    DateTime createdAt,
    FieldValue createdAtFieldValue,
    DateTime start,
    FieldValue startFieldValue,
    DateTime end,
    FieldValue endFieldValue,
    String title,
    FieldValue titleFieldValue,
    String description,
    FieldValue descriptionFieldValue,
    String host,
    FieldValue hostFieldValue,
    String location,
    FieldValue locationFieldValue,
    List<String> invitees,
    FieldValue inviteesFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    DateTime createdAt,
    FieldValue createdAtFieldValue,
    DateTime start,
    FieldValue startFieldValue,
    DateTime end,
    FieldValue endFieldValue,
    String title,
    FieldValue titleFieldValue,
    String description,
    FieldValue descriptionFieldValue,
    String host,
    FieldValue hostFieldValue,
    String location,
    FieldValue locationFieldValue,
    List<String> invitees,
    FieldValue inviteesFieldValue,
  });
}

class _$MeetingDocumentReference
    extends FirestoreDocumentReference<Meeting, MeetingDocumentSnapshot>
    implements MeetingDocumentReference {
  _$MeetingDocumentReference(this.reference);

  @override
  final DocumentReference<Meeting> reference;

  /// A reference to the [MeetingCollectionReference] containing this document.
  MeetingCollectionReference get parent {
    return _$MeetingCollectionReference(reference.firestore);
  }

  @override
  Stream<MeetingDocumentSnapshot> snapshots() {
    return reference.snapshots().map(MeetingDocumentSnapshot._);
  }

  @override
  Future<MeetingDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(MeetingDocumentSnapshot._);
  }

  @override
  Future<MeetingDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(MeetingDocumentSnapshot._);
  }

  Future<void> update({
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? start = _sentinel,
    FieldValue? startFieldValue,
    Object? end = _sentinel,
    FieldValue? endFieldValue,
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? host = _sentinel,
    FieldValue? hostFieldValue,
    Object? location = _sentinel,
    FieldValue? locationFieldValue,
    Object? invitees = _sentinel,
    FieldValue? inviteesFieldValue,
  }) async {
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      start == _sentinel || startFieldValue == null,
      "Cannot specify both start and startFieldValue",
    );
    assert(
      end == _sentinel || endFieldValue == null,
      "Cannot specify both end and endFieldValue",
    );
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      host == _sentinel || hostFieldValue == null,
      "Cannot specify both host and hostFieldValue",
    );
    assert(
      location == _sentinel || locationFieldValue == null,
      "Cannot specify both location and locationFieldValue",
    );
    assert(
      invitees == _sentinel || inviteesFieldValue == null,
      "Cannot specify both invitees and inviteesFieldValue",
    );
    final json = {
      if (createdAt != _sentinel)
        _$MeetingFieldMap['createdAt']!:
            _$MeetingPerFieldToJson.createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$MeetingFieldMap['createdAt']!: createdAtFieldValue,
      if (start != _sentinel)
        _$MeetingFieldMap['start']!:
            _$MeetingPerFieldToJson.start(start as DateTime),
      if (startFieldValue != null) _$MeetingFieldMap['start']!: startFieldValue,
      if (end != _sentinel)
        _$MeetingFieldMap['end']!: _$MeetingPerFieldToJson.end(end as DateTime),
      if (endFieldValue != null) _$MeetingFieldMap['end']!: endFieldValue,
      if (title != _sentinel)
        _$MeetingFieldMap['title']!:
            _$MeetingPerFieldToJson.title(title as String),
      if (titleFieldValue != null) _$MeetingFieldMap['title']!: titleFieldValue,
      if (description != _sentinel)
        _$MeetingFieldMap['description']!:
            _$MeetingPerFieldToJson.description(description as String),
      if (descriptionFieldValue != null)
        _$MeetingFieldMap['description']!: descriptionFieldValue,
      if (host != _sentinel)
        _$MeetingFieldMap['host']!:
            _$MeetingPerFieldToJson.host(host as String),
      if (hostFieldValue != null) _$MeetingFieldMap['host']!: hostFieldValue,
      if (location != _sentinel)
        _$MeetingFieldMap['location']!:
            _$MeetingPerFieldToJson.location(location as String),
      if (locationFieldValue != null)
        _$MeetingFieldMap['location']!: locationFieldValue,
      if (invitees != _sentinel)
        _$MeetingFieldMap['invitees']!:
            _$MeetingPerFieldToJson.invitees(invitees as List<String>),
      if (inviteesFieldValue != null)
        _$MeetingFieldMap['invitees']!: inviteesFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? start = _sentinel,
    FieldValue? startFieldValue,
    Object? end = _sentinel,
    FieldValue? endFieldValue,
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? host = _sentinel,
    FieldValue? hostFieldValue,
    Object? location = _sentinel,
    FieldValue? locationFieldValue,
    Object? invitees = _sentinel,
    FieldValue? inviteesFieldValue,
  }) {
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      start == _sentinel || startFieldValue == null,
      "Cannot specify both start and startFieldValue",
    );
    assert(
      end == _sentinel || endFieldValue == null,
      "Cannot specify both end and endFieldValue",
    );
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      host == _sentinel || hostFieldValue == null,
      "Cannot specify both host and hostFieldValue",
    );
    assert(
      location == _sentinel || locationFieldValue == null,
      "Cannot specify both location and locationFieldValue",
    );
    assert(
      invitees == _sentinel || inviteesFieldValue == null,
      "Cannot specify both invitees and inviteesFieldValue",
    );
    final json = {
      if (createdAt != _sentinel)
        _$MeetingFieldMap['createdAt']!:
            _$MeetingPerFieldToJson.createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$MeetingFieldMap['createdAt']!: createdAtFieldValue,
      if (start != _sentinel)
        _$MeetingFieldMap['start']!:
            _$MeetingPerFieldToJson.start(start as DateTime),
      if (startFieldValue != null) _$MeetingFieldMap['start']!: startFieldValue,
      if (end != _sentinel)
        _$MeetingFieldMap['end']!: _$MeetingPerFieldToJson.end(end as DateTime),
      if (endFieldValue != null) _$MeetingFieldMap['end']!: endFieldValue,
      if (title != _sentinel)
        _$MeetingFieldMap['title']!:
            _$MeetingPerFieldToJson.title(title as String),
      if (titleFieldValue != null) _$MeetingFieldMap['title']!: titleFieldValue,
      if (description != _sentinel)
        _$MeetingFieldMap['description']!:
            _$MeetingPerFieldToJson.description(description as String),
      if (descriptionFieldValue != null)
        _$MeetingFieldMap['description']!: descriptionFieldValue,
      if (host != _sentinel)
        _$MeetingFieldMap['host']!:
            _$MeetingPerFieldToJson.host(host as String),
      if (hostFieldValue != null) _$MeetingFieldMap['host']!: hostFieldValue,
      if (location != _sentinel)
        _$MeetingFieldMap['location']!:
            _$MeetingPerFieldToJson.location(location as String),
      if (locationFieldValue != null)
        _$MeetingFieldMap['location']!: locationFieldValue,
      if (invitees != _sentinel)
        _$MeetingFieldMap['invitees']!:
            _$MeetingPerFieldToJson.invitees(invitees as List<String>),
      if (inviteesFieldValue != null)
        _$MeetingFieldMap['invitees']!: inviteesFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is MeetingDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class MeetingQuery
    implements QueryReference<Meeting, MeetingQuerySnapshot> {
  @override
  MeetingQuery limit(int limit);

  @override
  MeetingQuery limitToLast(int limit);

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
  MeetingQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
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
  MeetingQuery whereFieldPath(
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

  MeetingQuery whereDocumentId({
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
  MeetingQuery whereCreatedAt({
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
  MeetingQuery whereStart({
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
  MeetingQuery whereEnd({
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
  MeetingQuery whereTitle({
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
  MeetingQuery whereDescription({
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
  MeetingQuery whereHost({
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
  MeetingQuery whereLocation({
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
  MeetingQuery whereInvitees({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  });

  MeetingQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  });

  MeetingQuery orderByCreatedAt({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  });

  MeetingQuery orderByStart({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  });

  MeetingQuery orderByEnd({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  });

  MeetingQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  });

  MeetingQuery orderByDescription({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  });

  MeetingQuery orderByHost({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  });

  MeetingQuery orderByLocation({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  });

  MeetingQuery orderByInvitees({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  });
}

class _$MeetingQuery extends QueryReference<Meeting, MeetingQuerySnapshot>
    implements MeetingQuery {
  _$MeetingQuery(
    this._collection, {
    required Query<Meeting> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<MeetingQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(MeetingQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<MeetingQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(MeetingQuerySnapshot._fromQuerySnapshot);
  }

  @override
  MeetingQuery limit(int limit) {
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  MeetingQuery limitToLast(int limit) {
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  MeetingQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
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
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  MeetingQuery whereFieldPath(
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
    return _$MeetingQuery(
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

  MeetingQuery whereDocumentId({
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
    return _$MeetingQuery(
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

  MeetingQuery whereCreatedAt({
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
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MeetingFieldMap['createdAt']!,
        isEqualTo: isEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.createdAt(isEqualTo as DateTime)
            : notSetQueryParam,
        isNotEqualTo: isNotEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.createdAt(isNotEqualTo as DateTime)
            : notSetQueryParam,
        isLessThan: isLessThan != notSetQueryParam
            ? _$MeetingPerFieldToJson.createdAt(isLessThan as DateTime)
            : notSetQueryParam,
        isLessThanOrEqualTo: isLessThanOrEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.createdAt(isLessThanOrEqualTo as DateTime)
            : notSetQueryParam,
        isGreaterThan: isGreaterThan != notSetQueryParam
            ? _$MeetingPerFieldToJson.createdAt(isGreaterThan as DateTime)
            : notSetQueryParam,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson
                .createdAt(isGreaterThanOrEqualTo as DateTime)
            : notSetQueryParam,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MeetingPerFieldToJson.createdAt(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$MeetingPerFieldToJson.createdAt(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  MeetingQuery whereStart({
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
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MeetingFieldMap['start']!,
        isEqualTo: isEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.start(isEqualTo as DateTime)
            : notSetQueryParam,
        isNotEqualTo: isNotEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.start(isNotEqualTo as DateTime)
            : notSetQueryParam,
        isLessThan: isLessThan != notSetQueryParam
            ? _$MeetingPerFieldToJson.start(isLessThan as DateTime)
            : notSetQueryParam,
        isLessThanOrEqualTo: isLessThanOrEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.start(isLessThanOrEqualTo as DateTime)
            : notSetQueryParam,
        isGreaterThan: isGreaterThan != notSetQueryParam
            ? _$MeetingPerFieldToJson.start(isGreaterThan as DateTime)
            : notSetQueryParam,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.start(isGreaterThanOrEqualTo as DateTime)
            : notSetQueryParam,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MeetingPerFieldToJson.start(e)),
        whereNotIn: whereNotIn?.map((e) => _$MeetingPerFieldToJson.start(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  MeetingQuery whereEnd({
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
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MeetingFieldMap['end']!,
        isEqualTo: isEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.end(isEqualTo as DateTime)
            : notSetQueryParam,
        isNotEqualTo: isNotEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.end(isNotEqualTo as DateTime)
            : notSetQueryParam,
        isLessThan: isLessThan != notSetQueryParam
            ? _$MeetingPerFieldToJson.end(isLessThan as DateTime)
            : notSetQueryParam,
        isLessThanOrEqualTo: isLessThanOrEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.end(isLessThanOrEqualTo as DateTime)
            : notSetQueryParam,
        isGreaterThan: isGreaterThan != notSetQueryParam
            ? _$MeetingPerFieldToJson.end(isGreaterThan as DateTime)
            : notSetQueryParam,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.end(isGreaterThanOrEqualTo as DateTime)
            : notSetQueryParam,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MeetingPerFieldToJson.end(e)),
        whereNotIn: whereNotIn?.map((e) => _$MeetingPerFieldToJson.end(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  MeetingQuery whereTitle({
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
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MeetingFieldMap['title']!,
        isEqualTo: isEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.title(isEqualTo as String)
            : notSetQueryParam,
        isNotEqualTo: isNotEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.title(isNotEqualTo as String)
            : notSetQueryParam,
        isLessThan: isLessThan != notSetQueryParam
            ? _$MeetingPerFieldToJson.title(isLessThan as String)
            : notSetQueryParam,
        isLessThanOrEqualTo: isLessThanOrEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.title(isLessThanOrEqualTo as String)
            : notSetQueryParam,
        isGreaterThan: isGreaterThan != notSetQueryParam
            ? _$MeetingPerFieldToJson.title(isGreaterThan as String)
            : notSetQueryParam,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.title(isGreaterThanOrEqualTo as String)
            : notSetQueryParam,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MeetingPerFieldToJson.title(e)),
        whereNotIn: whereNotIn?.map((e) => _$MeetingPerFieldToJson.title(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  MeetingQuery whereDescription({
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
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MeetingFieldMap['description']!,
        isEqualTo: isEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.description(isEqualTo as String)
            : notSetQueryParam,
        isNotEqualTo: isNotEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.description(isNotEqualTo as String)
            : notSetQueryParam,
        isLessThan: isLessThan != notSetQueryParam
            ? _$MeetingPerFieldToJson.description(isLessThan as String)
            : notSetQueryParam,
        isLessThanOrEqualTo: isLessThanOrEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.description(isLessThanOrEqualTo as String)
            : notSetQueryParam,
        isGreaterThan: isGreaterThan != notSetQueryParam
            ? _$MeetingPerFieldToJson.description(isGreaterThan as String)
            : notSetQueryParam,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson
                .description(isGreaterThanOrEqualTo as String)
            : notSetQueryParam,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MeetingPerFieldToJson.description(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$MeetingPerFieldToJson.description(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  MeetingQuery whereHost({
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
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MeetingFieldMap['host']!,
        isEqualTo: isEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.host(isEqualTo as String)
            : notSetQueryParam,
        isNotEqualTo: isNotEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.host(isNotEqualTo as String)
            : notSetQueryParam,
        isLessThan: isLessThan != notSetQueryParam
            ? _$MeetingPerFieldToJson.host(isLessThan as String)
            : notSetQueryParam,
        isLessThanOrEqualTo: isLessThanOrEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.host(isLessThanOrEqualTo as String)
            : notSetQueryParam,
        isGreaterThan: isGreaterThan != notSetQueryParam
            ? _$MeetingPerFieldToJson.host(isGreaterThan as String)
            : notSetQueryParam,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.host(isGreaterThanOrEqualTo as String)
            : notSetQueryParam,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MeetingPerFieldToJson.host(e)),
        whereNotIn: whereNotIn?.map((e) => _$MeetingPerFieldToJson.host(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  MeetingQuery whereLocation({
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
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MeetingFieldMap['location']!,
        isEqualTo: isEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.location(isEqualTo as String)
            : notSetQueryParam,
        isNotEqualTo: isNotEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.location(isNotEqualTo as String)
            : notSetQueryParam,
        isLessThan: isLessThan != notSetQueryParam
            ? _$MeetingPerFieldToJson.location(isLessThan as String)
            : notSetQueryParam,
        isLessThanOrEqualTo: isLessThanOrEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.location(isLessThanOrEqualTo as String)
            : notSetQueryParam,
        isGreaterThan: isGreaterThan != notSetQueryParam
            ? _$MeetingPerFieldToJson.location(isGreaterThan as String)
            : notSetQueryParam,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.location(isGreaterThanOrEqualTo as String)
            : notSetQueryParam,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MeetingPerFieldToJson.location(e)),
        whereNotIn: whereNotIn?.map((e) => _$MeetingPerFieldToJson.location(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  MeetingQuery whereInvitees({
    Object? isEqualTo = notSetQueryParam,
    Object? isNotEqualTo = notSetQueryParam,
    Object? isLessThan = notSetQueryParam,
    Object? isLessThanOrEqualTo = notSetQueryParam,
    Object? isGreaterThan = notSetQueryParam,
    Object? isGreaterThanOrEqualTo = notSetQueryParam,
    bool? isNull,
    Object? arrayContains = notSetQueryParam,
    List<String>? arrayContainsAny,
  }) {
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MeetingFieldMap['invitees']!,
        isEqualTo: isEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.invitees(isEqualTo as List<String>)
            : notSetQueryParam,
        isNotEqualTo: isNotEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson.invitees(isNotEqualTo as List<String>)
            : notSetQueryParam,
        isLessThan: isLessThan != notSetQueryParam
            ? _$MeetingPerFieldToJson.invitees(isLessThan as List<String>)
            : notSetQueryParam,
        isLessThanOrEqualTo: isLessThanOrEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson
                .invitees(isLessThanOrEqualTo as List<String>)
            : notSetQueryParam,
        isGreaterThan: isGreaterThan != notSetQueryParam
            ? _$MeetingPerFieldToJson.invitees(isGreaterThan as List<String>)
            : notSetQueryParam,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != notSetQueryParam
            ? _$MeetingPerFieldToJson
                .invitees(isGreaterThanOrEqualTo as List<String>)
            : notSetQueryParam,
        isNull: isNull,
        arrayContains: arrayContains != notSetQueryParam
            ? (_$MeetingPerFieldToJson.invitees([arrayContains as String])
                    as List?)!
                .single
            : notSetQueryParam,
        arrayContainsAny: arrayContainsAny != null
            ? _$MeetingPerFieldToJson.invitees(arrayContainsAny)
                as Iterable<Object>?
            : null,
      ),
      $queryCursor: $queryCursor,
    );
  }

  MeetingQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
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

    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  MeetingQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$MeetingFieldMap['createdAt']!, descending: descending);
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

    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  MeetingQuery orderByStart({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$MeetingFieldMap['start']!,
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

    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  MeetingQuery orderByEnd({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$MeetingFieldMap['end']!,
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

    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  MeetingQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$MeetingFieldMap['title']!,
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

    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  MeetingQuery orderByDescription({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$MeetingFieldMap['description']!, descending: descending);
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

    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  MeetingQuery orderByHost({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$MeetingFieldMap['host']!,
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

    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  MeetingQuery orderByLocation({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$MeetingFieldMap['location']!, descending: descending);
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

    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  MeetingQuery orderByInvitees({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MeetingDocumentSnapshot? startAtDocument,
    MeetingDocumentSnapshot? endAtDocument,
    MeetingDocumentSnapshot? endBeforeDocument,
    MeetingDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$MeetingFieldMap['invitees']!, descending: descending);
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

    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$MeetingQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class MeetingDocumentSnapshot extends FirestoreDocumentSnapshot<Meeting> {
  MeetingDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Meeting> snapshot;

  @override
  MeetingDocumentReference get reference {
    return MeetingDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Meeting? data;
}

class MeetingQuerySnapshot
    extends FirestoreQuerySnapshot<Meeting, MeetingQueryDocumentSnapshot> {
  MeetingQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory MeetingQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Meeting> snapshot,
  ) {
    final docs = snapshot.docs.map(MeetingQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        MeetingDocumentSnapshot._,
      );
    }).toList();

    return MeetingQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<MeetingDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    MeetingDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<MeetingDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Meeting> snapshot;

  @override
  final List<MeetingQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<MeetingDocumentSnapshot>> docChanges;
}

class MeetingQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Meeting>
    implements MeetingDocumentSnapshot {
  MeetingQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Meeting> snapshot;

  @override
  final Meeting data;

  @override
  MeetingDocumentReference get reference {
    return MeetingDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meeting _$MeetingFromJson(Map<String, dynamic> json) => Meeting(
      json['title'] as String,
      json['description'] as String,
      json['host'] as String,
      json['location'] as String,
      (json['invitees'] as List<dynamic>).map((e) => e as String).toList(),
      Converters.localTime(json['start'] as Timestamp),
      Converters.localTime(json['end'] as Timestamp),
      Converters.localTime(json['createdAt'] as Timestamp),
      id: json['id'] as String? ?? '',
    );

const _$MeetingFieldMap = <String, String>{
  'createdAt': 'createdAt',
  'start': 'start',
  'end': 'end',
  'id': 'id',
  'title': 'title',
  'description': 'description',
  'host': 'host',
  'location': 'location',
  'invitees': 'invitees',
};

// ignore: unused_element
abstract class _$MeetingPerFieldToJson {
  // ignore: unused_element
  static Object? createdAt(DateTime instance) => Converters.timestamp(instance);
  // ignore: unused_element
  static Object? start(DateTime instance) => Converters.timestamp(instance);
  // ignore: unused_element
  static Object? end(DateTime instance) => Converters.timestamp(instance);
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? title(String instance) => instance;
  // ignore: unused_element
  static Object? description(String instance) => instance;
  // ignore: unused_element
  static Object? host(String instance) => instance;
  // ignore: unused_element
  static Object? location(String instance) => instance;
  // ignore: unused_element
  static Object? invitees(List<String> instance) => instance;
}

Map<String, dynamic> _$MeetingToJson(Meeting instance) => <String, dynamic>{
      'createdAt': Converters.timestamp(instance.createdAt),
      'start': Converters.timestamp(instance.start),
      'end': Converters.timestamp(instance.end),
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'host': instance.host,
      'location': instance.location,
      'invitees': instance.invitees,
    };
