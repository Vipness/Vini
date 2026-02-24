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

String generatePhotoUrl(String name) {
  final trimmed = name.trim();

  // Odstrani vse, kar ni črka ali presledek
  final sanitized = trimmed.replaceAll(RegExp(r'[^a-zA-Z\s]'), '');

  // Če po tem ni več črk, uporabi fallback
  final finalName = sanitized.trim().isEmpty ? 'User' : sanitized.trim();

  // Encode za URL
  final encodedName = Uri.encodeComponent(finalName);

  // Sestavi URL
  return 'https://ui-avatars.com/api/?name=$encodedName&background=random';
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
