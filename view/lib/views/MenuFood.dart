import 'package:cdp/views/Home.dart';
import 'package:cdp/views/MenuDrink.dart';
import 'package:cdp/views/widgets/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(17.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button(
                  "Carte des boissons",
                  () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuDrink())))
            ],
          ),
          Category("Poké Bowl"),
          Category("Suppléments"),
        ],
      ),
    ));
  }
}
