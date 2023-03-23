import 'package:flutter_app/models/receipt.dart';

abstract class AppState {
  static List<Receipt> receipts = [];

  static void addReceipt(Receipt receipt) {
    receipts.add(receipt);
  }
}