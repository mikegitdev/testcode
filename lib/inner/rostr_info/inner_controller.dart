import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/data/local_storage.dart';
import 'package:tasker/models/emoji_model.dart';

class InnerController extends GetxController {
  EmojiModel? selectedEmoji;
  List<EmojiModel>? createdEmojis;
  String createEmojiImage = '';
  TextEditingController createEmojiTitle = TextEditingController();

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

  loadData()async{
    createdEmojis = await SharedPreferenceService.loadEmojis();
    update();
  }

  @override
  void onInit() {
    loadData();
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

  void chooseEmojiImage(EmojiModel image){
    createEmojiImage = image.emoji;
    update();
  }

  void createEmoji(){
    String image = createEmojiImage;
    String title = createEmojiTitle.text.trim();

    if(image.isNotEmpty && title.isNotEmpty){
      final newEmoji = EmojiModel(emoji: image, title: title, isSelected: false);
      if(createdEmojis != null){
        createdEmojis!.add(newEmoji);
        update();
        SharedPreferenceService.storeEmojis(createdEmojis!);
      }
    }
  }
}
