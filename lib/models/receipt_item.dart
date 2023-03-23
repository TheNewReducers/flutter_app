class ReceiptItem {
  final String title;
  final String category;
  final double carbon;

  ReceiptItem({required this.title, required this.category, required this.carbon});

  ReceiptItem.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        category = json['category'],
        carbon = json['carbon'];

  static ReceiptItem parseJson(Map<String, dynamic> json) {
    final title = json['name'];
    final category = json['category'];
    final carbon = json['price'];

    return ReceiptItem(title: title, category: category, carbon: carbon);
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'category': category,
    'carbon': carbon,
  };
}