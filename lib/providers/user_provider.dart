import 'package:amazon_clone/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    password: '',
    address: '',
    type: '',
    email: '',
    token: '',
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
