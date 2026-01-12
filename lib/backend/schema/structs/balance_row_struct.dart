// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BalanceRowStruct extends FFFirebaseStruct {
  BalanceRowStruct({
    DocumentReference? userRef,
    double? amount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userRef = userRef,
        _amount = amount,
        super(firestoreUtilData);

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;

  bool hasUserRef() => _userRef != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  static BalanceRowStruct fromMap(Map<String, dynamic> data) =>
      BalanceRowStruct(
        userRef: data['userRef'] as DocumentReference?,
        amount: castToType<double>(data['amount']),
      );

  static BalanceRowStruct? maybeFromMap(dynamic data) => data is Map
      ? BalanceRowStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userRef': _userRef,
        'amount': _amount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userRef': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
      }.withoutNulls;

  static BalanceRowStruct fromSerializableMap(Map<String, dynamic> data) =>
      BalanceRowStruct(
        userRef: deserializeParam(
          data['userRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'BalanceRowStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BalanceRowStruct &&
        userRef == other.userRef &&
        amount == other.amount;
  }

  @override
  int get hashCode => const ListEquality().hash([userRef, amount]);
}

BalanceRowStruct createBalanceRowStruct({
  DocumentReference? userRef,
  double? amount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BalanceRowStruct(
      userRef: userRef,
      amount: amount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BalanceRowStruct? updateBalanceRowStruct(
  BalanceRowStruct? balanceRow, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    balanceRow
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBalanceRowStructData(
  Map<String, dynamic> firestoreData,
  BalanceRowStruct? balanceRow,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (balanceRow == null) {
    return;
  }
  if (balanceRow.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && balanceRow.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final balanceRowData = getBalanceRowFirestoreData(balanceRow, forFieldValue);
  final nestedData = balanceRowData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = balanceRow.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBalanceRowFirestoreData(
  BalanceRowStruct? balanceRow, [
  bool forFieldValue = false,
]) {
  if (balanceRow == null) {
    return {};
  }
  final firestoreData = mapToFirestore(balanceRow.toMap());

  // Add any Firestore field values
  balanceRow.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBalanceRowListFirestoreData(
  List<BalanceRowStruct>? balanceRows,
) =>
    balanceRows?.map((e) => getBalanceRowFirestoreData(e, true)).toList() ?? [];
