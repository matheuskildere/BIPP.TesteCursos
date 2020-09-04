import 'dart:convert';

import 'package:Bipp/app/models/course_model.dart';
import 'package:Bipp/app/pages/course/course_page.dart';
import 'package:Bipp/app/utils/theme/color.dart';
import 'package:Bipp/app/widgets/customAppBar.dart';
import 'package:Bipp/app/widgets/customButton.dart';
import 'package:Bipp/app/widgets/customDrawer.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      endDrawer: CustomDrawer(),
      body: Column(
        children: <Widget>[
          CustomAppBar(scaffoldKey: _scaffoldKey),
          SizedBox(height: 20,),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                width: double.maxFinite,
                child: FutureBuilder<List<CourseModel>>(
                  future: _getListOfCouses(),
                  builder: (context, snapshot) {
                    int countButtons = 0;
                    return !snapshot.hasError && snapshot.hasData ? Column(
                      children: snapshot.data.map(
                        (courseModel) {
                          countButtons++;
                          return Column(
                            children: <Widget>[
                              CustomButton(
                                title: courseModel.title,
                                urlImage: courseModel.urlImage,
                                buttonFunction: () => Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => CoursePage(courseModel: courseModel,),)
                                ),
                              ),
                              countButtons < snapshot.data.length ? Divider(): Container()
                            ],
                          );
                        },
                      ).toList()
                    ): Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.assignment_late, color: colorGreyB2, size: 30,),
                              SizedBox(width: 10,),
                              Text("Ops, algo deu errado!"),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text("Não encontramos nenhum curso ou treinamento para você!", textAlign: TextAlign.center,)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<String> _loadJsonFromAsset() async {
    return await rootBundle.loadString("assets/data/courses_data.json");
  }

  Future<dynamic> _fileToJson() async {
    String jsonString = await _loadJsonFromAsset();
    final jsonResponse = jsonDecode(jsonString)["courses"];

    return jsonResponse;
  }

  Future<List<CourseModel>> _getListOfCouses() async {
    dynamic response = await _fileToJson();
    List<CourseModel> listCouses = List();
    for (var course in response) {
      if (course['urlImagesDescription'] !=null) {
        List<String> urlImagesList = List();
        for (String url in course['urlImagesDescription']) {
          urlImagesList.add(url);
        }
        listCouses.add(CourseModel(
          title: course['title'],
          urlImage: course['urlImage'],
          description: course['description'],
          urlImagesDescription: urlImagesList
        ));
      }else {
        listCouses.add(CourseModel(
          title: course['title'],
          urlImage: course['urlImage'],
          description: course['description']
        ));
      }
      
    }
    return listCouses;
  }
}