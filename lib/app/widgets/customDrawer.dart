import 'package:Bipp/app/utils/theme/color.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10, top: 20, bottom: 20),
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.menu, color: colorOrange, size: 30,),
              onPressed: () => Navigator.pop(context),
            )
          ),
          Center(
            child: FancyShimmerImage(
              height: 150,
              width: 150,
              imageUrl: "https://towerdefensesqn.files.wordpress.com/2013/09/engrenagens_laranja.png?w=640",
              boxFit: BoxFit.cover,  
            ),
          )
        ]
      )
    );
  }
}