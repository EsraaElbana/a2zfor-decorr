
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreference{

  static SharedPreferences? shared;
  static init()async{
    shared = await SharedPreferences.getInstance();
    print("Shared Initial");
  }

  static Future<dynamic>? setData({ required key, required value})async {
    if(value is bool) {
      return   await shared?.setBool(key, value);
    } else if(value is String) {
      return   await shared?.setString(key, value);
    }
    else if(value is int) {
      return await  shared?.setInt(key, value);
    }
    else if(value is double) {
      return await  shared?.setDouble(key, value);
    }
    else if(value is List<String>) {
      return await  shared?.setStringList(key, value);
    }
    return null;
  }

  static getData({required key})
  {
    return  shared?.get(key);
  }
static Future clear() async {
   await shared!.clear();

  print("SignOut");
}


  static Future remove({required key}) async {
    await shared!.remove(key);
  }
}