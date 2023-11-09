import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scheduler_app/models/annotations.dart';
import 'package:scheduler_app/helpers.dart';

part 'user.g.dart';

class BaseUser {
  BaseUser(
    this.email,
    this.name,
    this.birthday,
    this.phone,
    this.image,
    this.role, {
    this.id = '',
  });

  @Id()
  final String id;

  final String email;
  final String name;
  final String phone;
  final String image;
  final String role;

  @DateTimeField
  final DateTime birthday;
}

@FirestoreSerializable
class UserData extends BaseUser {
  UserData(
    this.uid,
    super.email,
    super.name,
    super.birthday,
    super.phone,
    super.image,
    super.role, {
    super.id,
  });

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
      baseUser.role,
    );
  }
}

@Collection<UserData>('users')
final UserRef = UserDataCollectionReference();
