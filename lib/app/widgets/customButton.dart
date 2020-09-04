import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String urlImage;
  final Function buttonFunction;

  CustomButton({@required this.title, @required this.urlImage, this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: buttonFunction,
        child: Container(
          padding: EdgeInsets.only(top:20, right: 20,left: 50, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(child: Text(title, style: Theme.of(context).textTheme.bodyText2,)),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FancyShimmerImage(
                  height: 80,
                  width: 80,  
                  imageUrl: urlImage,
                  boxFit: BoxFit.cover,  
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}