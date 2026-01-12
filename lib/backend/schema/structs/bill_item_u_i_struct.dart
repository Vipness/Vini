// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BillItemUIStruct extends FFFirebaseStruct {
  BillItemUIStruct({
    String? title,
    double? amount,
    List<DocumentReference>? participants,
    String? splitType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _amount = amount,
        _participants = participants,
        _splitType = splitType,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "participants" field.
  List<DocumentReference>? _participants;
  List<DocumentReference> get participants => _participants ?? const [];
  set participants(List<DocumentReference>? val) => _participants = val;

  void updateParticipants(Function(List<DocumentReference>) updateFn) {
    updateFn(_participants ??= []);
  }

  bool hasParticipants() => _participants != null;

  // "splitType" field.
  String? _splitType;
  String get splitType => _splitType ?? 'enakomerno';
  set splitType(String? val) => _splitType = val;

  bool hasSplitType() => _splitType != null;

  static BillItemUIStruct fromMap(Map<String, dynamic> data) =>
      BillItemUIStruct(
        title: data['title'] as String?,
        amount: castToType<double>(data['amount']),
        participants: getDataList(data['participants']),
        splitType: data['splitType'] as String?,
      );

  static BillItemUIStruct? maybeFromMap(dynamic data) => data is Map
      ? BillItemUIStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'amount': _amount,
        'participants': _participants,
        'splitType': _splitType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'participants': serializeParam(
          _participants,
          ParamType.DocumentReference,
          isList: true,
        ),
        'splitType': serializeParam(
          _splitType,
          ParamType.String,
        ),
      }.withoutNulls;

  static BillItemUIStruct fromSerializableMap(Map<String, dynamic> data) =>
      BillItemUIStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        participants: deserializeParam<DocumentReference>(
          data['participants'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['users'],
        ),
        splitType: deserializeParam(
          data['splitType'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BillItemUIStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BillItemUIStruct &&
        title == other.title &&
        amount == other.amount &&
        listEquality.equals(participants, other.participants) &&
        splitType == other.splitType;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, amount, participants, splitType]);
}

BillItemUIStruct createBillItemUIStruct({
  String? title,
  double? amount,
  String? splitType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BillItemUIStruct(
      title: title,
      amount: amount,
      splitType: splitType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BillItemUIStruct? updateBillItemUIStruct(
  BillItemUIStruct? billItemUI, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    billItemUI
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBillItemUIStructData(
  Map<String, dynamic> firestoreData,
  BillItemUIStruct? billItemUI,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (billItemUI == null) {
    return;
  }
  if (billItemUI.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && billItemUI.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final billItemUIData = getBillItemUIFirestoreData(billItemUI, forFieldValue);
  final nestedData = billItemUIData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = billItemUI.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBillItemUIFirestoreData(
  BillItemUIStruct? billItemUI, [
  bool forFieldValue = false,
]) {
  if (billItemUI == null) {
    return {};
  }
  final firestoreData = mapToFirestore(billItemUI.toMap());

  // Add any Firestore field values
  billItemUI.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBillItemUIListFirestoreData(
  List<BillItemUIStruct>? billItemUIs,
) =>
    billItemUIs?.map((e) => getBillItemUIFirestoreData(e, true)).toList() ?? [];
