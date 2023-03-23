import 'package:flutter_app/models/receipt_item.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

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

  Receipt.fromJson(Map<String, dynamic> json)
      : id = uuid.v5(Uuid.NAMESPACE_URL, 'com.example.flutter_app'),
        title = json['store']['name'],
        items = (json['items'] as List<dynamic>)
            .map((item) => ReceiptItem.fromJson(item))
            .toList(),
        createdAt = DateTime.now();  

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'items': items.map((item) => item.toJson()).toList(),
    'createdAt': createdAt.toIso8601String(),
  };
}