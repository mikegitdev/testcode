import 'package:flutter/material.dart';

enum ImageSourceType { gallery, camera }

class Ratings {
  String ratingTitle;
  String ratingScore;
  Ratings({required this.ratingTitle, required this.ratingScore});
}

class Tags {
  String lookTitle;
  Color lookColor;
  Tags({
    required this.lookTitle,
    required this.lookColor,
  });
}
