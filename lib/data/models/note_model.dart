class Note{
  String title;
  String comment;

  Note({required this.title,required this.comment});

  Note.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        comment = json['comment'];

  Map<String, dynamic> toJson() => {
    'title' : title,
    'comment' : comment,
  };
}