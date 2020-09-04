import 'dart:convert';

import 'package:flutter/material.dart';

class CourseModel {
  String title;
  String urlImage;
  String description;
  List<String> urlImagesDescription;

  CourseModel({
    @required this.title,
    @required this.urlImage, 
    @required this.description,
    this.urlImagesDescription,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'urlImage': urlImage,
      'description': description,
      'urlImagesDescription': urlImagesDescription,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return CourseModel(
      title: map['title'],
      urlImage: map['urlImage'],
      description: map['description'],
      urlImagesDescription: map['urlImagesDescription'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) => CourseModel.fromMap(json.decode(source));
}
