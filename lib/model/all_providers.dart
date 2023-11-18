
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:voco_case_study/controller/token_manager.dart';
import 'package:voco_case_study/model/user_model.dart';




final httpUserProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: 'https://reqres.in/'));
  });

final usersProvider = FutureProvider<List<UserModel>>((ref)async {
  final _dio = ref.watch(httpUserProvider);

  final result = await _dio.get("api/users?page=2");

  List<dynamic> _mapData = result.data["data"] as List<dynamic>;

  List<UserModel> userList =
      _mapData.map((e) => UserModel.fromMap(e)).toList();
      
      return userList;  
},);

final tokenProvider = StateNotifierProvider<TokenManager,String?>((ref) {
  return TokenManager(null);
},);






