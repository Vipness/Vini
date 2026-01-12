import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DebtsRecord extends FirestoreRecord {
  DebtsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "householdRef" field.
  DocumentReference? _householdRef;
  DocumentReference? get householdRef => _householdRef;
  bool hasHouseholdRef() => _householdRef != null;

  // "billRef" field.
  DocumentReference? _billRef;
  DocumentReference? get billRef => _billRef;
  bool hasBillRef() => _billRef != null;

  // "from" field.
  DocumentReference? _from;
  DocumentReference? get from => _from;
  bool hasFrom() => _from != null;

  // "to" field.
  DocumentReference? _to;
  DocumentReference? get to => _to;
  bool hasTo() => _to != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _householdRef = snapshotData['householdRef'] as DocumentReference?;
    _billRef = snapshotData['billRef'] as DocumentReference?;
    _from = snapshotData['from'] as DocumentReference?;
    _to = snapshotData['to'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('debts');

  static Stream<DebtsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DebtsRecord.fromSnapshot(s));

  static Future<DebtsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DebtsRecord.fromSnapshot(s));

  static DebtsRecord fromSnapshot(DocumentSnapshot snapshot) => DebtsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DebtsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DebtsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DebtsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DebtsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDebtsRecordData({
  DocumentReference? householdRef,
  DocumentReference? billRef,
  DocumentReference? from,
  DocumentReference? to,
  double? amount,
  String? status,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'householdRef': householdRef,
      'billRef': billRef,
      'from': from,
      'to': to,
      'amount': amount,
      'status': status,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class DebtsRecordDocumentEquality implements Equality<DebtsRecord> {
  const DebtsRecordDocumentEquality();

  @override
  bool equals(DebtsRecord? e1, DebtsRecord? e2) {
    return e1?.householdRef == e2?.householdRef &&
        e1?.billRef == e2?.billRef &&
        e1?.from == e2?.from &&
        e1?.to == e2?.to &&
        e1?.amount == e2?.amount &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(DebtsRecord? e) => const ListEquality().hash([
        e?.householdRef,
        e?.billRef,
        e?.from,
        e?.to,
        e?.amount,
        e?.status,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is DebtsRecord;
}
