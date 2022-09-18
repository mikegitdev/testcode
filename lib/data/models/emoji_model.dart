class EmojiModel {
  final String emoji;
  String? title;
  bool isSelected;
  bool isEnabled;

  EmojiModel({
    this.title,
    this.isEnabled=true,
    required this.emoji,
    required this.isSelected,
  });


  EmojiModel.fromJson(Map<String, dynamic> json)
      : emoji = json['emoji'],
        title = json['title'],
        isEnabled = json['isEnabled'],
        isSelected = json['isSelected'];

  Map<String, dynamic> toJson() => {
    'emoji' : emoji,
    'title' : title,
    "isEnabled" : isEnabled,
    'isSelected' : isSelected,
  };
}
