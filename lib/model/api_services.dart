
import 'package:http/http.dart' as http;
import 'dart:convert';


class ApiService {
  Future<String?> login(String username, String password) async {
    // API isteği gönderme ve token alma işlemleri burada gerçekleştirilir.
    // Örnek olarak reqres.in kullanılmıştır.
    final response = await http.post(
      Uri.parse('https://reqres.in/api/login'),
      body: {'email': username, 'password': password},
    );

    final data = json.decode(response.body);
    switch(response.statusCode){
      case 200:
      return data["token"];
      case 400:
      return null;    
    }
  }
  }

  
