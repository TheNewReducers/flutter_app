class ReceiptItem {
  final String title;
  final String category;
  final double carbon;

  ReceiptItem({required this.title, required this.category, required this.carbon});

  ReceiptItem.FromJson(Map<String, dynamic> json)
      : title = json['name'],
        category = json['category'],
        carbon = json['price'];
}