import 'package:cdp/views/MenuFood.dart';
import 'package:cdp/views/widgets/Button.dart';
import 'package:cdp/views/widgets/Product.dart';
import 'package:cdp/views/widgets/Separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuDrink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                    "Carte des poissons",
                    () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MenuFood())))
              ],
            ),
            Category("Bières"),
            Product.drink("Barbar", 4.00),
            Product.drink("Bertinchamps triple", 6.50),
            Product.drink("Besos", 4.00),
            Product.drink("Bicyclette", 4.00),
            Product.drink("Blanche de Namur rosée", 3.00),
            Product.drink("BMX", 4.50),
            Category("Vins"),
            Product.drink("Verre de rosé", 3.00),
            Product.drink("Verre de rouge", 3.00),
            Product.drink("Verre de blanc", 3.00),
            Product.drink("Cava MVSA", 4.50),
            Product.drink("Btl Cava MVSA", 25.00),
            Category("Softs"),
            Product.drink("Verre de rosé", 3.00),
            Product.drink("Verre de rouge", 3.00),
            Product.drink("Verre de blanc", 3.00),
            Product.drink("Cava MVSA", 4.50),
            Product.drink("Btl Cava MVSA", 25.00),
            Category("Spiritueux"),
            Product.drink("Verre de rosé", 3.00),
            Product.drink("Verre de rouge", 3.00),
            Product.drink("Verre de blanc", 3.00),
            Product.drink("Cava MVSA", 4.50),
            Product.drink("Btl Cava MVSA", 25.00),
            Product.drink("Verre de rosé", 3.00),
            Product.drink("Verre de rouge", 3.00),
            Product.drink("Verre de blanc", 3.00),
            Product.drink("Cava MVSA", 4.50),
            Product.drink("Btl Cava MVSA", 25.00),
          ],
        ),
      ),
    ));
  }
}

class Category extends StatelessWidget {
  final _text;
  Category(this._text);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(_text, style: Theme.of(context).textTheme.headline3),
            ],
          ),
          Row(
            children: [Separator(0.0, 0.0)],
          )
        ],
      ),
    );
  }
}
