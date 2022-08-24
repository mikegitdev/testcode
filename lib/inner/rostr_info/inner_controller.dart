import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/models/emoji_model.dart';

class InnerController extends GetxController {
  final count = 0;
  bool isPressed = false;
  EmojiModel? selectedEmoji;
  List<EmojiModel> localEmojis = [
    EmojiModel(emoji: '😍', title: 'Love', isSelected: false),
    EmojiModel(emoji: '🔥', title: 'Hot', isSelected: false),
    EmojiModel(emoji: '🍷', title: 'Date', isSelected: false),
    EmojiModel(emoji: '🤩', title: 'Obsessed', isSelected: false),
    EmojiModel(emoji: '😈', title: 'Thrilling', isSelected: false),
    EmojiModel(emoji: '🤡', title: 'Funny', isSelected: false),
    EmojiModel(emoji: '🤮', title: 'Ick', isSelected: false),
    EmojiModel(emoji: '👻', title: 'Ghost', isSelected: false),
    EmojiModel(emoji: '✅', title: 'Added', isSelected: false),
    EmojiModel(emoji: '🔺', title: 'Promoted', isSelected: false),
    EmojiModel(emoji: '🔻', title: 'Demoted', isSelected: false),
    EmojiModel(emoji: '❌', title: 'Removed', isSelected: false),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void chooseEmoji(EmojiModel object) {
    for(var emoji in localEmojis){
      if(emoji.title == object.title && object.isSelected == false){
        emoji.isSelected = true;
        selectedEmoji = emoji;
      }else{
        emoji.isSelected = false;
      }
    }
    update();
    debugPrint(selectedEmoji!.title);
  }
}
