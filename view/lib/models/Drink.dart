class Drink {
  final int id;
  final double price;
  final String title;

  Drink({required this.id, required this.title, required this.price});

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(id: json['id'], title: json['title'], price: json['price']);
  }
}
