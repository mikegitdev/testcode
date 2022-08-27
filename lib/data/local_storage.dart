import 'package:shared_preferences/shared_preferences.dart';

enum StorageKey{
  EMOJIS,
  RATINGS,
  TAGS,
}

class SharedPreferenceService{
  static Future<bool> storeStringList(StorageKey key, List<String> list) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    // List<String> stringList = list.map((e) => jsonEncode(e.toJson())).toList();
    return await pref.setStringList(key.name, list);
  }
  static Future<List<String>?> loadStringList(StorageKey key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // List<EmojiModel>? objectsList =  pref.getStringList('emojis')?.map((stringList) => EmojiModel.fromJson(jsonDecode(stringList))).toList();
    List<String>? list = pref.getStringList(key.name);
    return list;
  }

  // static Future<bool> removeAString(StorageKey key, EmojiModel object) async{
  //   List<String>? list = await loadStringList(key);
  //   // List<EmojiModel>? emojis = await loadEmojis();
  //   if(list != null){
  //     list.removeWhere((element) => element.emoji == object.emoji && element.title == object.title);
  //     storeEmojis(emojis);
  //   }
  //   return emojis?.contains(object) ?? false;
  // }

  static Future<bool> removeEmojis(StorageKey key) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove(key.name);
  }
}