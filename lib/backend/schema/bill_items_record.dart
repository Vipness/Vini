import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Postavke
class BillItemsRecord extends FirestoreRecord {
  BillItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "billRef" field.
  DocumentReference? _billRef;
  DocumentReference? get billRef => _billRef;
  bool hasBillRef() => _billRef != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "splitType" field.
  String? _splitType;
  String get splitType => _splitType ?? '';
  bool hasSplitType() => _splitType != null;

  // "participants" field.
  List<DocumentReference>? _participants;
  List<DocumentReference> get participants => _participants ?? const [];
  bool hasParticipants() => _participants != null;

  // "amountPerPerson" field.
  double? _amountPerPerson;
  double get amountPerPerson => _amountPerPerson ?? 0.0;
  bool hasAmountPerPerson() => _amountPerPerson != null;

  void _initializeFields() {
    _billRef = snapshotData['billRef'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _splitType = snapshotData['splitType'] as String?;
    _participants = getDataList(snapshotData['participants']);
    _amountPerPerson = castToType<double>(snapshotData['amountPerPerson']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bill_items');

  static Stream<BillItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BillItemsRecord.fromSnapshot(s));

  static Future<BillItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BillItemsRecord.fromSnapshot(s));

  static BillItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BillItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BillItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BillItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BillItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BillItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBillItemsRecordData({
  DocumentReference? billRef,
  String? title,
  double? amount,
  String? splitType,
  double? amountPerPerson,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'billRef': billRef,
      'title': title,
      'amount': amount,
      'splitType': splitType,
      'amountPerPerson': amountPerPerson,
    }.withoutNulls,
  );

  return firestoreData;
}

class BillItemsRecordDocumentEquality implements Equality<BillItemsRecord> {
  const BillItemsRecordDocumentEquality();

  @override
  bool equals(BillItemsRecord? e1, BillItemsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.billRef == e2?.billRef &&
        e1?.title == e2?.title &&
        e1?.amount == e2?.amount &&
        e1?.splitType == e2?.splitType &&
        listEquality.equals(e1?.participants, e2?.participants) &&
        e1?.amountPerPerson == e2?.amountPerPerson;
  }

  @override
  int hash(BillItemsRecord? e) => const ListEquality().hash([
        e?.billRef,
        e?.title,
        e?.amount,
        e?.splitType,
        e?.participants,
        e?.amountPerPerson
      ]);

  @override
  bool isValidKey(Object? o) => o is BillItemsRecord;
}
