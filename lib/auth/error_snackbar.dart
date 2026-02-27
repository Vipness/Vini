import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/flutter_flow/flutter_flow_theme.dart';

class ErrorSnackBar {
  static void show(
    BuildContext context,
    String message, {
    Color? backgroundColor,
    int durationMs = 4000,
  }) {
    final theme = FlutterFlowTheme.of(context);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: durationMs),
        backgroundColor: backgroundColor ?? theme.info,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: theme.bodyLarge.override(
            font: GoogleFonts.inter(
              fontWeight: theme.bodyLarge.fontWeight,
              fontStyle: theme.bodyLarge.fontStyle,
            ),
            color: Colors.black,
            letterSpacing: 0.0,
            fontWeight: theme.bodyLarge.fontWeight,
            fontStyle: theme.bodyLarge.fontStyle,
          ),
        ),
      ),
    );
  }
}
