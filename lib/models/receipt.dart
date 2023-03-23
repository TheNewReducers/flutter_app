import 'package:flutter_app/models/receipt_item.dart';
import 'package:intl/intl.dart';

class Receipt {
  final String id;
  final String title;
  final List<ReceiptItem> items;
  final DateTime createdAt;

  Receipt(this.id, this.title, this.items, this.createdAt);

  double get totalCarbon {
    double total = 0;
    for (ReceiptItem item in items) {
      total += item.carbon;
    }
    return total;
  }

  String get formattedCreatedAt {
    final DateFormat formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(createdAt);
  }
}