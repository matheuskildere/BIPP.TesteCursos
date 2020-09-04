import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String urlImage;

  CustomButton({@required this.title, @required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){print("object");},
        child: Container(
          padding: EdgeInsets.only(top:20, right: 20,left: 50, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(child: Text(title, style: Theme.of(context).textTheme.bodyText2,)),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  urlImage,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}