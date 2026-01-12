import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'bill_details_widget.dart' show BillDetailsWidget;
import 'package:flutter/material.dart';

class BillDetailsModel extends FlutterFlowModel<BillDetailsWidget> {
  ///  Local state fields for this page.
  /// Za razdelitev
  List<BalanceRowStruct> balanceRows = [];
  void addToBalanceRows(BalanceRowStruct item) => balanceRows.add(item);
  void removeFromBalanceRows(BalanceRowStruct item) => balanceRows.remove(item);
  void removeAtIndexFromBalanceRows(int index) => balanceRows.removeAt(index);
  void insertAtIndexInBalanceRows(int index, BalanceRowStruct item) =>
      balanceRows.insert(index, item);
  void updateBalanceRowsAtIndex(
          int index, Function(BalanceRowStruct) updateFn) =>
      balanceRows[index] = updateFn(balanceRows[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in BillDetails widget.
  List<BillItemsRecord>? billItems;
  // State field(s) for task widget.
  FocusNode? taskFocusNode;
  TextEditingController? taskTextController;
  String? Function(BuildContext, String?)? taskTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taskFocusNode?.dispose();
    taskTextController?.dispose();
  }
}
