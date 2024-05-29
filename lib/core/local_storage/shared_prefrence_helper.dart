import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
  static late SharedPreferences sharedPreferences;
  static Future<void> init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static setToken(String token){
    sharedPreferences.setString("token", token);
  }
  static String getToken(){
    return sharedPreferences.getString("token")??"";
  }
  static clearToken(){
    sharedPreferences.remove("token");
  }

  static setUseName(String userName){
    sharedPreferences.setString("userName", userName);
  }
  static String getUserName(){
    return sharedPreferences.getString("userName")??"";
  }
  static clearUserName(){
    sharedPreferences.remove("userName");
  }
}