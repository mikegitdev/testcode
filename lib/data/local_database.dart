import 'package:hive/hive.dart';

enum DatabaseKey{
  EMOJIS,
  RATINGS,
  TAGS,
}

class LocalDatabase{
  static String DB_NAME = 'database';
  static Box box = Hive.box(DB_NAME);

  static Future<void> storeStringList (DatabaseKey key, List<String> list) async{
    // List<String> stringList = users.map((user) => jsonEncode(user.toJson())).toList();
    await box.put(key.name, list);
  }

  static Future<List<String>?> loadStringList(DatabaseKey key) async {
    if(box.containsKey('usersList')){
      // List<User> usersList = stringList.map((stringUser) => User.fromJson(jsonDecode(stringUser))).toList();
      return box.get(key.name);
    }
    return null;
  }

  Future<void> removeStringList(DatabaseKey key) async {
    await box.delete(key.name);
  }
}