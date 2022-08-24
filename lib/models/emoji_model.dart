class EmojiModel {
  final String emoji;
  String? title;
  bool isSelected;

  EmojiModel({
    this.title,
    required this.emoji,
    required this.isSelected,
  });
}
