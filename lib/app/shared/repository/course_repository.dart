import 'dart:convert';

import 'package:Bipp/app/models/course_model.dart';
import 'package:flutter/services.dart';

class CourseRepository {
  Future<String> _loadJsonAsset() async {
    return await rootBundle.loadString("assets/data/courses_data.json");
  }

  Future<dynamic> _fileToJson() async {
    String jsonString = await _loadJsonAsset();
    final jsonResponse = jsonDecode(jsonString)["courses"];

    return jsonResponse;
  }

  Future<List<CourseModel>> getListOfCouses() async {
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