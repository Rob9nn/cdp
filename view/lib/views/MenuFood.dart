import 'dart:convert';

import 'package:cdp/models/Food.dart';
import 'package:cdp/views/MenuDrink.dart';
import 'package:cdp/views/widgets/Button.dart';
import 'package:cdp/views/widgets/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cdp/assets/customIcons.dart';
import 'package:http/http.dart' as http;

Future<List<Food>> fetchFoods() async {
  final response =
      await http.get(Uri.parse('http://5.196.8.171:3000/category/foods'));
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body)["data"];
    List<Food> foods = data.map((f) => Food.fromJson(f)).toList();
    return foods;
  } else {
    throw Exception("Failed to fetch foods");
  }
}

class MenuFood extends StatefulWidget {
  @override
  _MenuFoodState createState() => _MenuFoodState();
}

class _MenuFoodState extends State<MenuFood> {
  late Future<List<Food>> foods;
  @override
  void initState() {
    super.initState();
    foods = fetchFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Carte du restaurant',
              style: Theme.of(context).textTheme.headline3),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuDrink())),
                  child: Icon(
                    CustomIcons.beer_1,
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
                FutureBuilder<List<Food>>(
                    future: foods,
                    builder: (context, AsyncSnapshot<List<Food>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            scrollDirection: Axis.vertical,
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
                                        return Product.food(
                                            snapshot.data![index]
                                                .products[indexBis].title,
                                            snapshot.data![index]
                                                .products[indexBis].price,
                                            snapshot.data![index]
                                                .products[indexBis].description,
                                            snapshot.data![index]
                                                .products[indexBis].ingredient);
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
