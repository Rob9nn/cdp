import 'dart:ffi';

import 'package:cdp/views/MenuDrink.dart';
import 'package:cdp/views/MenuFood.dart';
import 'package:cdp/views/widgets/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cdp/views/widgets/Separator.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: [
      Padding(
        padding: EdgeInsets.all(17.0),
        child: Container(
          child: Column(
            children: [_title(), _buttons()],
          ),
        ),
      )
    ]));
  }
}

class _title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height / 5),
      child: Column(
        children: [
          Row(
            children: [
              Separator(10.0, 10.0),
              Text('Bar à bières',
                  style: Theme.of(context).textTheme.headline2),
              Separator(10.0, 10.0),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text('Café de Paris',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1),
              )
            ],
          ),
          Row(
            children: [
              Separator(10.0, 40.0),
              Text('Brasserie', style: Theme.of(context).textTheme.headline2),
              Separator(40.0, 10.0)
            ],
          ),
        ],
      ),
    );
  }
}

class _buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height / 6),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                    'Carte des boissons',
                    () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MenuDrink())))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                    'Carte des poissons',
                    () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MenuFood())))
              ],
            ),
          )
        ],
      ),
    );
  }
}
