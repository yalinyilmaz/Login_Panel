import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Token ın database'e ve Riverpod a yazılma işlemi , database den getirilme işlemi ve çıkış durumunda database den silinme işlemi buradaki fonksiyonlarda yapılır.

class TokenManager extends StateNotifier<String?>{
  TokenManager(String? token) : super(token);

  Future <void> tokenyaz(token)async{
     final sharedPrefs = await SharedPreferences.getInstance();
     sharedPrefs.setString('token',token) ;
     state = token;
  }

  Future <void> tokengetir()async{
    final sharedPrefs = await SharedPreferences.getInstance();
    String? getirilenToken = sharedPrefs.getString("token");
    state = getirilenToken;

  }

  Future <void> tokensil()async{
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.remove('token');
    state = null;
  }


  
}