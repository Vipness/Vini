import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// računi
class BillsRecord extends FirestoreRecord {
  BillsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "householdRef" field.
  DocumentReference? _householdRef;
  DocumentReference? get householdRef => _householdRef;
  bool hasHouseholdRef() => _householdRef != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "paidBy" field.
  DocumentReference? _paidBy;
  DocumentReference? get paidBy => _paidBy;
  bool hasPaidBy() => _paidBy != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "totalAmount" field.
  double? _totalAmount;
  double get totalAmount => _totalAmount ?? 0.0;
  bool hasTotalAmount() => _totalAmount != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _householdRef = snapshotData['householdRef'] as DocumentReference?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _paidBy = snapshotData['paidBy'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _totalAmount = castToType<double>(snapshotData['totalAmount']);
    _status = snapshotData['status'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bills');

  static Stream<BillsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BillsRecord.fromSnapshot(s));

  static Future<BillsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BillsRecord.fromSnapshot(s));

  static BillsRecord fromSnapshot(DocumentSnapshot snapshot) => BillsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BillsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BillsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BillsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BillsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBillsRecordData({
  DocumentReference? householdRef,
  DocumentReference? createdBy,
  DocumentReference? paidBy,
  String? title,
  DateTime? createdAt,
  double? totalAmount,
  String? status,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'householdRef': householdRef,
      'createdBy': createdBy,
      'paidBy': paidBy,
      'title': title,
      'createdAt': createdAt,
      'totalAmount': totalAmount,
      'status': status,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class BillsRecordDocumentEquality implements Equality<BillsRecord> {
  const BillsRecordDocumentEquality();

  @override
  bool equals(BillsRecord? e1, BillsRecord? e2) {
    return e1?.householdRef == e2?.householdRef &&
        e1?.createdBy == e2?.createdBy &&
        e1?.paidBy == e2?.paidBy &&
        e1?.title == e2?.title &&
        e1?.createdAt == e2?.createdAt &&
        e1?.totalAmount == e2?.totalAmount &&
        e1?.status == e2?.status &&
        e1?.date == e2?.date;
  }

  @override
  int hash(BillsRecord? e) => const ListEquality().hash([
        e?.householdRef,
        e?.createdBy,
        e?.paidBy,
        e?.title,
        e?.createdAt,
        e?.totalAmount,
        e?.status,
        e?.date
      ]);

  @override
  bool isValidKey(Object? o) => o is BillsRecord;
}
