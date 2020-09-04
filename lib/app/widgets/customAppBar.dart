import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double heigthScreen;
  CustomAppBar({this.heigthScreen});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height/2.8,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.black26,
            image: DecorationImage(
              image: NetworkImage("https://lh3.googleusercontent.com/proxy/6OxuX_qVxHj2Disp5nO-lybzbNzHkd023lznsOyBYvmZKd-FTnINqz9cAiKJKsZoGx2K6t3QqJeLK3bsJx1uDF_NhgrcDuNm_pmITc7F08JHDz5he4RDfiSv94Yudr-Vmem8dJunXc74XQLk8MWBXToMUB6fNg"),
              fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("CURSOS E TREINAMENTOS",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text("Selecione o curso ou treinamento\nque deseja.", 
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 40),
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.menu, color: Colors.white, size: 30,),
                  onPressed: null//() => _scaffoldKey.currentState.openDrawer(),
                )
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 45),
                alignment: Alignment.topLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://imagensemoldes.com.br/wp-content/uploads/2020/05/Engrenagem-Bicolor-PNG-1200x675.png",
                    height: 45,
                  ),
                )
              ),
            ],
          ),
        ),
      ],
    );
  }
}