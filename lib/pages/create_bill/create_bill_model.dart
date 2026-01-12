import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'create_bill_widget.dart' show CreateBillWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class CreateBillModel extends FlutterFlowModel<CreateBillWidget> {
  ///  Local state fields for this page.

  List<BillItemUIStruct> billItemsUI = [];
  void addToBillItemsUI(BillItemUIStruct item) => billItemsUI.add(item);
  void removeFromBillItemsUI(BillItemUIStruct item) => billItemsUI.remove(item);
  void removeAtIndexFromBillItemsUI(int index) => billItemsUI.removeAt(index);
  void insertAtIndexInBillItemsUI(int index, BillItemUIStruct item) =>
      billItemsUI.insert(index, item);
  void updateBillItemsUIAtIndex(
          int index, Function(BillItemUIStruct) updateFn) =>
      billItemsUI[index] = updateFn(billItemsUI[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for task widget.
  FocusNode? taskFocusNode;
  TextEditingController? taskTextController;
  String? Function(BuildContext, String?)? taskTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Bottom Sheet - AddorEditItem] action in Button widget.
  BillItemUIStruct? billItemUI;
  // Stores action output result for [Bottom Sheet - AddorEditItem] action in IconButton widget.
  BillItemUIStruct? billItemEdited;
  // Stores action output result for [Bottom Sheet - RemoveItem] action in IconButton widget.
  BillItemUIStruct? billItemReturned;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? payerRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BillsRecord? billRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taskFocusNode?.dispose();
    taskTextController?.dispose();
  }
}
