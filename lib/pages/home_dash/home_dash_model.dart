import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_dash_widget.dart' show HomeDashWidget;
import 'package:flutter/material.dart';

class HomeDashModel extends FlutterFlowModel<HomeDashWidget> {
  ///  Local state fields for this page.

  double youOwe = 0.0;

  double owedToYou = 0.0;

  double balance = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HomeDash widget.
  List<BillsRecord>? bills;
  // Stores action output result for [Firestore Query - Query a collection] action in HomeDash widget.
  List<BillItemsRecord>? billItems;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
