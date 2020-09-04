import 'dart:convert';

import 'package:flutter/material.dart';

class CourseModel {
  String title;
  String urlImage;
  String description;

  CourseModel({
    @required this.title,
    @required this.urlImage, 
    @required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'urlImage': urlImage,
      'description': description,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return CourseModel(
      title: map['title'],
      urlImage: map['urlImage'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) => CourseModel.fromMap(json.decode(source));
}
