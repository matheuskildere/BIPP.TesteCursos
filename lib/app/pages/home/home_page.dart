import 'dart:convert';

import 'package:Bipp/app/models/course_model.dart';
import 'package:Bipp/app/widgets/customAppBar.dart';
import 'package:Bipp/app/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: <Widget>[
          CustomAppBar(),
          SizedBox(height: 20,),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                width: double.maxFinite,
                child: FutureBuilder<List<CourseModel>>(
                  future: _getListOfCouses(),
                  builder: (context, snapshot) {
                    return !snapshot.hasError && snapshot.hasData ? Column(
                      children: snapshot.data.map(
                        (courseModel) => CustomButton(
                          title: courseModel.title,
                          urlImage: courseModel.urlImage,
                        ),
                      ).toList()
                    ): Text("Ola mundo");
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
      listCouses.add(CourseModel(
        title: course['title'],
        urlImage: course['urlImage'],
        description: course['description']
      ));
    }
    return listCouses;
  }
}