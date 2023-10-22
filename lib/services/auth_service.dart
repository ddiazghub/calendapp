import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:scheduler_app/models/user.dart';

class AuthService extends GetxController {
  final auth = FirebaseAuth.instance;
  final Rxn<UserWithCredentials> _user = Rxn();

  UserWithCredentials? get user => _user.value;

  set user(UserWithCredentials? value) => _user.value = value;

  Future<void> login(String email, String password) async {
    final credentials = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    print(credentials.user!.uid);
    final query = await UserRef.get();
    for (final doc in query.docs) {
      print(doc.data.toJson());
    }

    final doc = await UserRef.whereUid(isEqualTo: credentials.user!.uid).get();
    final data = doc.docs[0].data;

    user = UserWithCredentials(
      data,
      credentials,
    );
  }

  Future<void> signUp(BaseUser user, String password) async {
    final credentials = await auth.createUserWithEmailAndPassword(
      email: user.email,
      password: password,
    );

    print(credentials.user!.uid);
    final userData = UserData.from(user, credentials.user!);
    final doc = await UserRef.add(userData);
    print(doc.id);

    this.user = UserWithCredentials(
      userData,
      credentials,
    );
  }

  Future<bool> logOut() async => true;
}
