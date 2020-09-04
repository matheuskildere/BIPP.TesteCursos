import 'package:Bipp/app/models/course_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final bool isCoursePage;
  final CourseModel courseModel;
  final GlobalKey<ScaffoldState> scaffoldKey;
  CustomAppBar({this.isCoursePage = false, this.courseModel, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height/2.8,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.black12,
            image: DecorationImage(
              image:  NetworkImage(
                !isCoursePage ? "https://www.jaciaranews.com.br/userfiles/imagens/materias/medium/279165111_trocapneus2.jpg":
                courseModel.urlImage,

              ),
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
                padding: !isCoursePage ? EdgeInsets.only(bottom: 50.0, left: 20, right: 20):
                EdgeInsets.only(bottom: 70.0, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    isCoursePage ? InkWell(
                      onTap: ()=> Navigator.pop(context),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 2, color: Colors.white),
                            top: BorderSide(width: 2, color: Colors.white),
                            left: BorderSide(width: 2, color: Colors.white),
                            right: BorderSide(width: 2, color: Colors.white)
                          ),
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: Icon(Icons.arrow_back_ios, size: 15,color: Colors.white,),
                      ),
                    ): Container(), 
                    isCoursePage ? SizedBox(height: 5,): Container(),
                    Text(!isCoursePage ? "CURSOS E TREINAMENTOS": courseModel.title.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                    !isCoursePage ? Text("Selecione o curso ou treinamento\nque deseja.", 
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ): Container(),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 40),
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.menu, color: Colors.white, size: 30,),
                  onPressed: () => scaffoldKey.currentState.openEndDrawer(),
                )
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 45),
                alignment: Alignment.topLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FancyShimmerImage(
                    height: 55,
                    width: 65,
                    imageUrl: "https://towerdefensesqn.files.wordpress.com/2013/09/engrenagens_laranja.png?w=640",
                    boxFit: BoxFit.cover,  
                  )
                )
              ),
            ],
          ),
        ),
      ],
    );
  }
}