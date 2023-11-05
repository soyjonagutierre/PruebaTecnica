import 'package:flutter/foundation.dart';
import 'package:pruebatecnica/src/api.dart';

class UserModel extends ChangeNotifier {
  final ApiService apiService;
  String _name = '';
  String get name => _name;

  UserModel(this.apiService);

  void setName(String newName) {
    _name = newName;
    notifyListeners(); 
  }
}