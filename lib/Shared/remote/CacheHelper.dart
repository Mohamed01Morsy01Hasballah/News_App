import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static SharedPreferences? sharedPreference;
  static init()async {
    sharedPreference= await SharedPreferences.getInstance();
  }
 static Future<bool> SetData({
  required String key,
    required bool value,
})async{
  return await   sharedPreference!.setBool(key, value);
  }
  static bool? GetData({
  required String key
}) {
    return  sharedPreference!.getBool(key);
  }

}