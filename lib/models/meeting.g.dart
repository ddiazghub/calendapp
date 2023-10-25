// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters, duplicate_ignore

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
    return Meeting.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Meeting value,
    SetOptions? options,
  ) {
    return value.toJson();
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
      firestore.collection('messages').withConverter(
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
    String name,
    FieldValue nameFieldValue,
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
    String name,
    FieldValue nameFieldValue,
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
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
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
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
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
      if (name != _sentinel)
        _$MeetingFieldMap['name']!:
            _$MeetingPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$MeetingFieldMap['name']!: nameFieldValue,
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
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
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
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
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
      if (name != _sentinel)
        _$MeetingFieldMap['name']!:
            _$MeetingPerFieldToJson.name(name as String),
      if (nameFieldValue != null) _$MeetingFieldMap['name']!: nameFieldValue,
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
  MeetingQuery whereName({
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

  MeetingQuery orderByName({
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
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
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
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  }) {
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MeetingFieldMap['createdAt']!,
        isEqualTo: isEqualTo != null
            ? _$MeetingPerFieldToJson.createdAt(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$MeetingPerFieldToJson.createdAt(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$MeetingPerFieldToJson.createdAt(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$MeetingPerFieldToJson.createdAt(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$MeetingPerFieldToJson.createdAt(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$MeetingPerFieldToJson.createdAt(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MeetingPerFieldToJson.createdAt(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$MeetingPerFieldToJson.createdAt(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

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
  }) {
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MeetingFieldMap['start']!,
        isEqualTo:
            isEqualTo != null ? _$MeetingPerFieldToJson.start(isEqualTo) : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$MeetingPerFieldToJson.start(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$MeetingPerFieldToJson.start(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$MeetingPerFieldToJson.start(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$MeetingPerFieldToJson.start(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$MeetingPerFieldToJson.start(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MeetingPerFieldToJson.start(e)),
        whereNotIn: whereNotIn?.map((e) => _$MeetingPerFieldToJson.start(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

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
  }) {
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MeetingFieldMap['end']!,
        isEqualTo:
            isEqualTo != null ? _$MeetingPerFieldToJson.end(isEqualTo) : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$MeetingPerFieldToJson.end(isNotEqualTo)
            : null,
        isLessThan:
            isLessThan != null ? _$MeetingPerFieldToJson.end(isLessThan) : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$MeetingPerFieldToJson.end(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$MeetingPerFieldToJson.end(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$MeetingPerFieldToJson.end(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MeetingPerFieldToJson.end(e)),
        whereNotIn: whereNotIn?.map((e) => _$MeetingPerFieldToJson.end(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  MeetingQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MeetingFieldMap['name']!,
        isEqualTo:
            isEqualTo != null ? _$MeetingPerFieldToJson.name(isEqualTo) : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$MeetingPerFieldToJson.name(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$MeetingPerFieldToJson.name(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$MeetingPerFieldToJson.name(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$MeetingPerFieldToJson.name(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$MeetingPerFieldToJson.name(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MeetingPerFieldToJson.name(e)),
        whereNotIn: whereNotIn?.map((e) => _$MeetingPerFieldToJson.name(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

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
  }) {
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MeetingFieldMap['description']!,
        isEqualTo: isEqualTo != null
            ? _$MeetingPerFieldToJson.description(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$MeetingPerFieldToJson.description(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$MeetingPerFieldToJson.description(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$MeetingPerFieldToJson.description(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$MeetingPerFieldToJson.description(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$MeetingPerFieldToJson.description(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MeetingPerFieldToJson.description(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$MeetingPerFieldToJson.description(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

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
  }) {
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MeetingFieldMap['host']!,
        isEqualTo:
            isEqualTo != null ? _$MeetingPerFieldToJson.host(isEqualTo) : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$MeetingPerFieldToJson.host(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$MeetingPerFieldToJson.host(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$MeetingPerFieldToJson.host(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$MeetingPerFieldToJson.host(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$MeetingPerFieldToJson.host(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MeetingPerFieldToJson.host(e)),
        whereNotIn: whereNotIn?.map((e) => _$MeetingPerFieldToJson.host(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

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
  }) {
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MeetingFieldMap['location']!,
        isEqualTo: isEqualTo != null
            ? _$MeetingPerFieldToJson.location(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$MeetingPerFieldToJson.location(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$MeetingPerFieldToJson.location(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$MeetingPerFieldToJson.location(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$MeetingPerFieldToJson.location(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$MeetingPerFieldToJson.location(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$MeetingPerFieldToJson.location(e)),
        whereNotIn: whereNotIn?.map((e) => _$MeetingPerFieldToJson.location(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

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
  }) {
    return _$MeetingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$MeetingFieldMap['invitees']!,
        isEqualTo: isEqualTo != null
            ? _$MeetingPerFieldToJson.invitees(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$MeetingPerFieldToJson.invitees(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$MeetingPerFieldToJson.invitees(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$MeetingPerFieldToJson.invitees(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$MeetingPerFieldToJson.invitees(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$MeetingPerFieldToJson.invitees(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        arrayContains: arrayContains != null
            ? (_$MeetingPerFieldToJson.invitees([arrayContains]) as List?)!
                .single
            : null,
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

  MeetingQuery orderByName({
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
    final query = $referenceWithoutCursor.orderBy(_$MeetingFieldMap['name']!,
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
      json['name'] as String,
      json['description'] as String,
      json['host'] as String,
      json['location'] as String,
      (json['invitees'] as List<dynamic>).map((e) => e as String).toList(),
      Converters.localTime(json['start'] as Timestamp),
      Converters.localTime(json['end'] as Timestamp),
      Converters.localTime(json['createdAt'] as Timestamp),
    );

const _$MeetingFieldMap = <String, String>{
  'createdAt': 'createdAt',
  'start': 'start',
  'end': 'end',
  'name': 'name',
  'description': 'description',
  'host': 'host',
  'location': 'location',
  'invitees': 'invitees',
};

// ignore: unused_element
abstract class _$MeetingPerFieldToJson {
  // ignore: unused_element
  static Object? createdAt(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
  // ignore: unused_element
  static Object? start(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
  // ignore: unused_element
  static Object? end(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
  // ignore: unused_element
  static Object? name(String instance) => instance;
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
      'createdAt':
          const FirestoreDateTimeConverter().toJson(instance.createdAt),
      'start': const FirestoreDateTimeConverter().toJson(instance.start),
      'end': const FirestoreDateTimeConverter().toJson(instance.end),
      'name': instance.name,
      'description': instance.description,
      'host': instance.host,
      'location': instance.location,
      'invitees': instance.invitees,
    };
