import 'dart:convert';

import 'package:cdp/models/Drink.dart';
import 'package:cdp/views/MenuFood.dart';
import 'package:cdp/views/widgets/Product.dart';
import 'package:cdp/views/widgets/Separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:cdp/assets/customIcons.dart';

Future<List<Drink>> fetchDrinks() async {
  final response =
      await http.get(Uri.parse('http://5.196.8.171:3000/category/drinks'));
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body)["data"];
    List<Drink> drinks = data.map((d) => Drink.fromJson(d)).toList();
    return drinks;
  } else {
    throw Exception("Failed to fetch drinks");
  }
}

class MenuDrink extends StatefulWidget {
  @override
  _MenuDrinkState createState() => _MenuDrinkState();
}

class _MenuDrinkState extends State<MenuDrink> {
  late Future<List<Drink>> drinks;
  @override
  void initState() {
    super.initState();
    drinks = fetchDrinks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Carte des boissons',
              style: Theme.of(context).textTheme.headline3),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuFood())),
                  child: Icon(
                    CustomIcons.fish,
                    color: Color(0xffe5e5e5),
                    size: 20,
                  )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              children: [
                FutureBuilder<List<Drink>>(
                    future: drinks,
                    builder: (context, AsyncSnapshot<List<Drink>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Category(snapshot.data![index].title),
                                  ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          snapshot.data![index].products.length,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int indexBis) {
                                        return Product.drink(
                                            snapshot.data![index]
                                                .products[indexBis].title,
                                            snapshot.data![index]
                                                .products[indexBis].price);
                                      })
                                ],
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      return Center(child: CircularProgressIndicator());
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
              Flexible(
                  child: Text(_text,
                      style: Theme.of(context).textTheme.headline3)),
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
