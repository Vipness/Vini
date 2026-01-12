import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'join_household_widget.dart' show JoinHouseholdWidget;
import 'package:flutter/material.dart';

class JoinHouseholdModel extends FlutterFlowModel<JoinHouseholdWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for user_name widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  // State field(s) for household_code widget.
  FocusNode? householdCodeFocusNode;
  TextEditingController? householdCodeTextController;
  String? Function(BuildContext, String?)? householdCodeTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  HouseholdsRecord? householdsRecord;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    householdCodeFocusNode?.dispose();
    householdCodeTextController?.dispose();
  }
}
