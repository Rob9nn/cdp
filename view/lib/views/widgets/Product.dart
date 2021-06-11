import 'package:flutter/widgets.dart';

class Product extends StatelessWidget {
  var _description, _ingredient;
  final _title, _price;

  Product.drink(this._title, this._price);

  Product.food(this._title, this._price, this._description, this._ingredient);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_title),
              Text(_price.toString().replaceAll(".", ",") + " €")
            ],
          )
        ],
      ),
    );
  }
}
