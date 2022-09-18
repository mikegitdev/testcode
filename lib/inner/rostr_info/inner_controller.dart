import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/data/local_storage.dart';
import 'package:tasker/inner/local_back.dart';
import 'package:tasker/data/models/emoji_model.dart';

enum ImageSourceType { gallery, camera }

class InnerController extends GetxController {
  EmojiModel? _selectedEmoji;
  List<EmojiModel>? _createdEmojis;
  String _createEmojiImage = '';
  TextEditingController createEmojiTitle = TextEditingController();

  List<EmojiModel> _reserveEmojis=[
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
  List<EmojiModel> get reserveEmojis => _reserveEmojis;
  bool get canCreateEmoji => _createEmojiImage.isNotEmpty && createEmojiTitle.text.trim().isNotEmpty;
  bool get isCreatedExist => _createdEmojis != null && _createdEmojis!.isNotEmpty;


  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData()async{
    List<String>? list =  await SharedPreferenceService.loadStringList(StorageKey.EMOJIS);
    if(list != null){
      _createdEmojis = list.map((string) => EmojiModel.fromJson(jsonDecode(string))).toList();
    }
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
  }

  void enableEmoji(EmojiModel object) {
    print("#################################################");
    print("${_localEmojis.length}");

    if(_localEmojis.contains(object)){
      for(var emoji in _reserveEmojis){
        if(emoji.title == object.title){
          emoji.isEnabled = false;
        }
      }
      _localEmojis.removeWhere((e) => e.title==object.title);
    }else if(_reserveEmojis.contains(object)){
      for(var emoji in _reserveEmojis){
        if(emoji.title == object.title){
          emoji.isEnabled = true;
          _localEmojis.add(emoji);
        }
      }
    }
    print("${_localEmojis.length}");
    print("#################################################");
    update();
    Get.forceAppUpdate();
  }

  void chooseEmojiImage(EmojiModel image){
    _createEmojiImage = image.emoji;
    for(var emoji in emojisSet){
      if(emoji.emoji == image.emoji && emoji.isSelected == false){
        emoji.isSelected = true;
      }else{
        emoji.isSelected = false;
      }
    }
    update();
    print('SELECTED: $_createEmojiImage => ${image.isSelected}');
  }

  void createEmoji(){
    if(canCreateEmoji){
      final newEmoji = EmojiModel(emoji: _createEmojiImage, title: createEmojiTitle.text.trim(), isSelected: false);
      if(_createdEmojis != null){
        _createdEmojis!.add(newEmoji);
      }else{
        _createdEmojis = [newEmoji];
      }
      update();
      List<String> stringList = _createdEmojis!.map((e) => jsonEncode(e.toJson())).toList();
      SharedPreferenceService.storeStringList(StorageKey.EMOJIS, stringList);
    }
    cleanCreatedEmoji();
  }

  void cleanCreatedEmoji(){
    _createEmojiImage = '';
    createEmojiTitle.clear();
    update();
  }

  void cleanSelectedEmoji(){
    _selectedEmoji = null;
    for(var emoji in _localEmojis){
      emoji.isSelected = false;
    }
    update();
  }

  Future openBottomSheet({required Widget bottomSheet, bool isCleanSelectedEmoji = false, bool isCleanCreatedEmoji = false}){
    return Get.bottomSheet(
      bottomSheet,
      isDismissible: false, // Dismiss when anywhere except the sheet pressed
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    ).whenComplete(() {
      if(isCleanSelectedEmoji){
        cleanSelectedEmoji();
      }else if(isCleanCreatedEmoji){
        cleanCreatedEmoji();
      }
    });
  }
}
