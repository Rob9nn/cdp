class Food {
  int id;
  String title;
  List<FoodProduct> products;

  Food({required this.id, required this.title, required this.products});

  factory Food.fromJson(Map<String, dynamic> json) {
    List<dynamic> fprod = json["Products"];
    List<FoodProduct> products =
        fprod.map((f) => FoodProduct.fromJson(f)).toList();
    return Food(id: json["id"], title: json["Title"], products: products);
  }
}

class FoodProduct {
  int id;
  String title;
  double price;
  String description;
  String ingredient;

  FoodProduct(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.ingredient});

  factory FoodProduct.fromJson(Map<String, dynamic> json) {
    return FoodProduct(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        ingredient: json["ingredient"]);
  }
}
