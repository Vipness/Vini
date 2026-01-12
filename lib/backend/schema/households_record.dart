import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HouseholdsRecord extends FirestoreRecord {
  HouseholdsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "members" field.
  List<DocumentReference>? _members;
  List<DocumentReference> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "admins" field.
  List<DocumentReference>? _admins;
  List<DocumentReference> get admins => _admins ?? const [];
  bool hasAdmins() => _admins != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "joinCode" field.
  String? _joinCode;
  String get joinCode => _joinCode ?? '';
  bool hasJoinCode() => _joinCode != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _members = getDataList(snapshotData['members']);
    _admins = getDataList(snapshotData['admins']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _joinCode = snapshotData['joinCode'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('households');

  static Stream<HouseholdsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HouseholdsRecord.fromSnapshot(s));

  static Future<HouseholdsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HouseholdsRecord.fromSnapshot(s));

  static HouseholdsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HouseholdsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HouseholdsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HouseholdsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HouseholdsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HouseholdsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHouseholdsRecordData({
  String? name,
  DateTime? createdAt,
  DocumentReference? createdBy,
  String? joinCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'createdAt': createdAt,
      'createdBy': createdBy,
      'joinCode': joinCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class HouseholdsRecordDocumentEquality implements Equality<HouseholdsRecord> {
  const HouseholdsRecordDocumentEquality();

  @override
  bool equals(HouseholdsRecord? e1, HouseholdsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.members, e2?.members) &&
        listEquality.equals(e1?.admins, e2?.admins) &&
        e1?.createdAt == e2?.createdAt &&
        e1?.createdBy == e2?.createdBy &&
        e1?.joinCode == e2?.joinCode;
  }

  @override
  int hash(HouseholdsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.members,
        e?.admins,
        e?.createdAt,
        e?.createdBy,
        e?.joinCode
      ]);

  @override
  bool isValidKey(Object? o) => o is HouseholdsRecord;
}
