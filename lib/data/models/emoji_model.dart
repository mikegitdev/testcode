class EmojiModel {
  final String emoji;
  String? title;
  bool isSelected;

  EmojiModel({
    this.title,
    required this.emoji,
    required this.isSelected,
  });


  EmojiModel.fromJson(Map<String, dynamic> json)
      : emoji = json['emoji'],
        title = json['title'],
        isSelected = json['isSelected'];

  Map<String, dynamic> toJson() => {
    'emoji' : emoji,
    'title' : title,
    'isSelected' : isSelected,
  };
}
