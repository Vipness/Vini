import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_household_widget.dart' show CreateHouseholdWidget;
import 'package:flutter/material.dart';

class CreateHouseholdModel extends FlutterFlowModel<CreateHouseholdWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for user_name widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  // State field(s) for household_name widget.
  FocusNode? householdNameFocusNode;
  TextEditingController? householdNameTextController;
  String? Function(BuildContext, String?)? householdNameTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  HouseholdsRecord? createdHousehold;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    householdNameFocusNode?.dispose();
    householdNameTextController?.dispose();
  }
}
