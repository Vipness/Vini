import '/flutter_flow/flutter_flow_util.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for password_conf widget.
  FocusNode? passwordConfFocusNode;
  TextEditingController? passwordConfTextController;
  late bool passwordConfVisibility;
  String? Function(BuildContext, String?)? passwordConfTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordConfVisibility = false;
  }

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    passwordConfFocusNode?.dispose();
    passwordConfTextController?.dispose();
  }
}
