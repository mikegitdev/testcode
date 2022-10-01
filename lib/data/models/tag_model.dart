import 'package:flutter/material.dart';

class Tag {
  String title;
  int color;
  bool isSelected;

  Tag({required this.title, required this.color, required this.isSelected});


  Tag.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        color = json['color'],
        isSelected = json['isSelected'];

  Map<String, dynamic> toJson() => {
    'title' : title,
    'color' : color,
    'isSelected' : isSelected,
};

}