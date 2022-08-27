import 'package:flutter/material.dart';

class Tag {
  String title;
  int color;

  Tag({required this.title, required this.color});


  Tag.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        color = json['color'];

  Map<String, dynamic> toJson() => {
    'title' : title,
    'color' : color,
  };

}