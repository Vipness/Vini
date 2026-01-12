import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'addor_edit_item_widget.dart' show AddorEditItemWidget;
import 'package:flutter/material.dart';

class AddorEditItemModel extends FlutterFlowModel<AddorEditItemWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for item_name widget.
  FocusNode? itemNameFocusNode;
  TextEditingController? itemNameTextController;
  String? Function(BuildContext, String?)? itemNameTextControllerValidator;
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    itemNameFocusNode?.dispose();
    itemNameTextController?.dispose();

    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }
}
