import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/data/local_storage.dart';
import 'package:tasker/inner/local_back.dart';
import 'package:tasker/models/emoji_model.dart';

class InnerController extends GetxController {
  EmojiModel? _selectedEmoji;
  List<EmojiModel>? _createdEmojis;
  String _createEmojiImage = '';
  TextEditingController createEmojiTitle = TextEditingController();

  final List<EmojiModel> _localEmojis = [
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

  EmojiModel? get selectedEmoji => _selectedEmoji;
  List<EmojiModel>? get createdEmojis => _createdEmojis;
  String get createEmojiImage => _createEmojiImage;
  List<EmojiModel> get localEmojis => _localEmojis;
  bool get canCreateEmoji => _createEmojiImage.isNotEmpty && createEmojiTitle.text.trim().isNotEmpty;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData()async{
    _createdEmojis = await SharedPreferenceService.loadEmojis();
    update();
  }

  void chooseEmoji(EmojiModel object) {
    for(var emoji in _localEmojis){
      if(emoji.title == object.title && object.isSelected == false){
        emoji.isSelected = true;
        _selectedEmoji = emoji;
      }else{
        emoji.isSelected = false;
      }
    }
    update();
    debugPrint(_selectedEmoji!.title);
  }

  void chooseEmojiImage(EmojiModel image){
    debugPrint('SELECTED: ${image.emoji} : ${image.isSelected}');
    _createEmojiImage = image.emoji;
    for(var emoji in emojisSet){
      if(emoji.emoji == image.emoji && emoji.isSelected == false){
        emoji.isSelected = true;
      }else{
        emoji.isSelected = false;
      }
    }
    update();
    print('$_createEmojiImage => ${image.isSelected}');
  }

  void createEmoji(){
    String image = _createEmojiImage;
    String title = createEmojiTitle.text.trim();
    print('TITLE: $title  IMAGE: $image CREATEDIMOJIS: ${createdEmojis?.length}');
    if(image.isNotEmpty && title.isNotEmpty){
      final newEmoji = EmojiModel(emoji: image, title: title, isSelected: false);
      if(_createdEmojis != null){
        _createdEmojis!.add(newEmoji);
        update();
        SharedPreferenceService.storeEmojis(_createdEmojis!);
      }else{
        List<EmojiModel> createdEmoji = [newEmoji];
        update();
        SharedPreferenceService.storeEmojis(createdEmoji);
      }
    }
    cleanCreateEmoji();
  }

  void cleanCreateEmoji(){
    _createEmojiImage = '';
    createEmojiTitle.clear();
    update();
  }
}
