import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:scheduler_app/models/user.dart';

class AuthService extends GetxController {
  static final _auth = FirebaseAuth.instance;
  final Rxn<User> _user = Rxn();

  AuthService() {
    user = _auth.currentUser;
  }

  User? get user => _user.value;

  set user(User? value) => _user.value = value;

  bool get isSignedIn => user != null;

  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp(BaseUser userData, String password) async {
    final credentials = await _auth.createUserWithEmailAndPassword(
      email: userData.email,
      password: password,
    );

    final uData = UserData.from(userData, credentials.user!);
    await UserRef.add(uData);
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}
