import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firestore_serializable.dart';

part 'user.g.dart';

class BaseUser {
  BaseUser(this.email, this.name, this.birthday, this.phone, this.image);

  final String email;
  final String name;
  final DateTime birthday;
  final String phone;
  final String image;
}

@FirestoreSerializable
class UserData extends BaseUser {
  UserData(this.uid, super.email, super.name, super.birthday, super.phone,
      super.image);

  final String uid;

  factory UserData.fromJson(Map<String, Object?> json) =>
      _$UserDataFromJson(json);
  Map<String, Object?> toJson() => _$UserDataToJson(this);

  factory UserData.from(BaseUser baseUser, User firebaseUser) {
    return UserData(
      firebaseUser.uid,
      baseUser.email,
      baseUser.name,
      baseUser.birthday,
      baseUser.phone,
      baseUser.image,
    );
  }
}

@Collection<UserData>('users')
final UserRef =
    UserDataCollectionReference();

class UserWithCredentials {
  UserWithCredentials(this.user, this.credentials);

  final UserData user;
  final UserCredential credentials;
}
