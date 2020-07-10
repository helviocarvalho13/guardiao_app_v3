import 'dart:async';


class Login {
  String _username;
  String _password;

  Login(this._username, this._password);

  Login.fromMap(Map<String, dynamic> map)
      : _username = map['usuario'],
        _password = map['password'];

  String get username => _username;
  String get codigo => _password;
}

abstract class LoginRepository{
  Future<int> retornaLogin(String username, String password);
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}