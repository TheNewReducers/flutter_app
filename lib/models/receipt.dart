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

  String get shortFormattedCreatedAt {
    final DateFormat formatter = DateFormat('dd.MM');
    return formatter.format(createdAt);
  }

  int get ageInDays {
    return createdAt.difference(DateTime.now()).inDays;
  }

  Receipt.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        items = (json['items'] as List<dynamic>)
            .map((item) => ReceiptItem.fromJson(item))
            .toList(),
        createdAt = DateTime.parse(json['createdAt']);  

  static Receipt parseFromApi(Map<String, dynamic> json) {
    final id = uuid.v5(Uuid.NAMESPACE_URL, 'com.example.flutter_app');
    final title = json['store'] != null && json['store']['name'] != null ? json['store']['name'] : 'Unknown';
    final items = (json['items'] as List<dynamic>)
        .map((item) => ReceiptItem.parseJson(item))
        .toList();
    DateTime createdAt = DateTime.now();
    if (json['createdAt'] != null) {
      try {
        createdAt = DateTime.parse(json["timestamp"]);  
      } catch (e) {}
    }

    return Receipt(id, title, items, createdAt);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'items': items.map((item) => item.toJson()).toList(),
    'createdAt': createdAt.toIso8601String(),
  };
}