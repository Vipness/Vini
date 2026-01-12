import '/flutter_flow/flutter_flow_util.dart';
import 'change_name_widget.dart' show ChangeNameWidget;
import 'package:flutter/material.dart';

class ChangeNameModel extends FlutterFlowModel<ChangeNameWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for name_conf widget.
  FocusNode? nameConfFocusNode;
  TextEditingController? nameConfTextController;
  String? Function(BuildContext, String?)? nameConfTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    nameConfFocusNode?.dispose();
    nameConfTextController?.dispose();
  }
}
