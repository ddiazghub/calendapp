import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserService extends GetxController {
  final _users = <String, User>{}.obs;

  Map<String, User> get users => _users;

  set users(Map<String, User> value) => _users.value = value;

  User? operator [](String key) => _users[key];
}
