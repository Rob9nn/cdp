import 'dart:convert';

import 'package:cdp/models/Drink.dart';
import 'package:cdp/views/MenuFood.dart';
import 'package:cdp/views/widgets/Button.dart';
import 'package:cdp/views/widgets/Product.dart';
import 'package:cdp/views/widgets/Separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

Future<Drink> fetchDrinks() async {
  final response = await http.get(Uri.parse('http://localhost:8080/product'));
  if (response.statusCode == 200) {
    return Drink.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to fetch drinks");
  }
}

class MenuDrink extends StatefulWidget {
  @override
  _MenuDrinkState createState() => _MenuDrinkState();
}

class _MenuDrinkState extends State<MenuDrink> {
  late Future<Drink> drinks;
  @override
  void initState() {
    super.initState();
    drinks = fetchDrinks();
  }

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
            FutureBuilder<Drink>(
                future: drinks,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Product.drink(
                        snapshot.data!.title, snapshot.data!.price);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return CircularProgressIndicator();
                })
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
