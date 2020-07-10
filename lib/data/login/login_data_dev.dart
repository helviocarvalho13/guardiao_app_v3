import 'dart:async';
import 'package:guardiao_app_v3/data/login/login_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DevLoginRepository implements LoginRepository{

  _salvarLogin(String token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  @override
  Future<int> retornaLogin(String username, String password) async{
    _salvarLogin('f4asd65f4s56a4fs56ad4f6sdf4a');
    return new Future.value(1);
  }

}