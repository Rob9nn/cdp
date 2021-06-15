class Drink {
  int id;
  String title;
  List<DrinkProduct> products;

  Drink({required this.id, required this.title, required this.products});

  factory Drink.fromJson(Map<String, dynamic> json) {
    List<dynamic> dprod = json["Products"];
    List<DrinkProduct> products =
        dprod.map((e) => DrinkProduct.fromJson(e)).toList();
    return Drink(id: json["id"], title: json["Title"], products: products);
  }
}

class DrinkProduct {
  int id;
  String title;
  double price;

  DrinkProduct({required this.id, required this.title, required this.price});

  factory DrinkProduct.fromJson(Map<String, dynamic> json) {
    return DrinkProduct(
        id: json["id"], title: json["title"], price: json["price"]);
  }
}
