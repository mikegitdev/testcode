class Rating {
  String title;
  double score;

  Rating({required this.title, this.score = 0});

  Rating.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        score = json['score'];

  Map<String, dynamic> toJson() => {
    'title' : title,
    'score' : score,
  };
}