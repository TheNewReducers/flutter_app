class ReceiptItem {
  final String title;
  final double price;
  final int amount;
  final String weight;
  final String dataName;
  final String category;
  final double carbon;

  ReceiptItem({required this.title, required this.category, required this.carbon, required this.price, required this.amount, required this.weight, required this.dataName});

  ReceiptItem.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        category = json['category'],
        price = json['price'],
        amount = json['amount'],
        weight = json['weight'],
        dataName = json['dataName'],
        carbon = json['carbon'];

  static ReceiptItem parseJson(Map<String, dynamic> json) {
    final title = json['name'] ?? '';
    final category = json['category'] ?? '';
    final price = json['price'] ?? 0;
    final amount = json['amount'] ?? 1;
    final weight = json['weight'] ?? '';
    final dataName = json['data_name'] ?? '';
    final carbon = json['co2_item'] ?? 0;

    return ReceiptItem(title: title, category: category, carbon: carbon, price: price, amount: amount, weight: weight, dataName: dataName);
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'category': category,
    'carbon': carbon,
    'price': price,
    'amount': amount,
    'weight': weight,
    'dataName': dataName,
  };
}