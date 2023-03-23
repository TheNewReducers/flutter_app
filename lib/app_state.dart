import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/models/receipt.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppState {// Obtain shared preferences.
  static final StreamController<List<Receipt>> _receiptsController = StreamController<List<Receipt>>.broadcast();
  static Stream<List<Receipt>> get receiptsStream => _receiptsController.stream;

  static List<Receipt> receipts = [];

  static void addReceipt(Receipt receipt) {
    receipts.add(receipt);
    _receiptsController.add(receipts);
  }

  static void removeReceipt(Receipt receipt) {
    receipts.remove(receipt);
    _receiptsController.add(receipts);
  }

  static Future<void> save() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("receipts", receipts.map<String>((e) => jsonEncode(e.toJson())).toList());
  }
}