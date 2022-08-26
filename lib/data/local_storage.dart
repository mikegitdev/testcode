import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasker/data/models/emoji_model.dart';

class SharedPreferenceService{

  static Future<bool> storeEmojis(List<EmojiModel> list) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> stringList = list.map((e) => jsonEncode(e.toJson())).toList();
    return await pref.setStringList('emojis', stringList);
  }
  static Future<List<EmojiModel>?> loadEmojis() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<EmojiModel>? objectsList =  pref.getStringList('emojis')?.map((stringList) => EmojiModel.fromJson(jsonDecode(stringList))).toList();
    return objectsList;
  }

  static Future<bool> removeAnEmoji(EmojiModel object) async{
    List<EmojiModel>? emojis = await loadEmojis();
    if(emojis != null){
      emojis.removeWhere((element) => element.emoji == object.emoji && element.title == object.title);
      storeEmojis(emojis);
    }
    return emojis?.contains(object) ?? false;
  }

  static Future<bool> removeEmojis() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove('emojis');
  }
}