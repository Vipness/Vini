import '/flutter_flow/flutter_flow_util.dart';
import 'invite_to_household_widget.dart' show InviteToHouseholdWidget;
import 'package:flutter/material.dart';

class InviteToHouseholdModel extends FlutterFlowModel<InviteToHouseholdWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();
  }
}
