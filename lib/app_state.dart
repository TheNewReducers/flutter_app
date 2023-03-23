import 'dart:async';

import 'package:flutter_app/models/receipt.dart';

abstract class AppState {
  static final StreamController<List<Receipt>> _receiptsController = StreamController<List<Receipt>>.broadcast();
  static Stream<List<Receipt>> get receiptsStream => _receiptsController.stream;

  static List<Receipt> receipts = [];

  static void addReceipt(Receipt receipt) {
    receipts.add(receipt);
    _receiptsController.add(receipts);
  }
}