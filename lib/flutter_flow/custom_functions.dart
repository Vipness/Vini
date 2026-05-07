import 'dart:convert';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

/// Generate profile picture by hashing user name so it stays the same
String generatePhotoUrl(String name) {
  final trimmed = name.trim();

  final sanitized = trimmed.replaceAll(RegExp(r'[^a-zA-Z\s]'), '');
  final finalName = sanitized.trim().isEmpty ? 'Uporabnik' : sanitized.trim();

  int hash = 0;
  // codeUnits = list of UTF-16 char codes e.g. 'A' = 65
  for (final char in finalName.codeUnits) {
    hash =
        (hash * 31 + char) & 0xFFFFFF; // 31 is a classic prime used in hashing
  } // & 0xFFFFFF clamps the result to 6 hex digits (a valid color)
  final color = hash
      .toRadixString(16)
      .padLeft(6, '0'); // convert to hex string e.g. "a3f1c0"

  final encodedName = Uri.encodeComponent(finalName);

  // Sestavi URL
  return 'https://ui-avatars.com/api/?name=$encodedName&background=$color&color=fff&size=128';
}

String formatAsEuro(double amount) {
  final format = NumberFormat.currency(
    locale: "sl_SI",
    symbol: '€',
    decimalDigits: 2,
  );

  return format.format(amount);
}

List<BalanceRowStruct> calculateBillBalance(
  DocumentReference paidBy,
  List<BillItemsRecord> billItems,
) {
  final Map<DocumentReference, double> balances = {};

  void add(DocumentReference user, double value) {
    balances[user] = (balances[user] ?? 0) + value;
  }

  for (final item in billItems) {
    final participants = item.participants;
    if (participants.isEmpty) continue;

    final share = item.amount / participants.length;

    for (final user in participants) {
      add(user, -share);
      add(paidBy, share);
    }
  }

  final rows = balances.entries
      .map(
        (e) => BalanceRowStruct(
          userRef: e.key,
          amount: double.parse(e.value.toStringAsFixed(2)),
        ),
      )
      .toList();

  rows.sort((a, b) {
    final aItem = a as BalanceRowStruct?;
    final bItem = b as BalanceRowStruct?;

    if (aItem?.userRef == paidBy) return -1;
    if (bItem?.userRef == paidBy) return 1;
    return 0;
  });

  return rows;
}
