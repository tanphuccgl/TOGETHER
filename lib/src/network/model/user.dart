import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:together/src/network/model/common/base_model.dart';

class WUser extends BaseModel {
  final String? name;
  final String? avatar;
  final String? username;
  final String? email;
  WUser({
    required String id,
    Timestamp? createdAt,
    Timestamp? updatedAt,
    this.name,
    this.avatar,
    this.username,
    this.email,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  WUser copyWith({
    String? id,
    Timestamp? createdAt,
    Timestamp? updatedAt,
    String? name,
    String? avatar,
    String? username,
    String? email,
  }) {
    return WUser(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      'name': name,
      'avatar': avatar,
      'username': username,
      'email': email,
    };
  }

  factory WUser.fromMap(Map<String, dynamic> map) {
    return WUser(
      id: map['id'] != null ? map['id'] as String : "",
      createdAt: map['createdAt'] != null
          ? map['createdAt'] as Timestamp
          : Timestamp.fromMillisecondsSinceEpoch(0),
      updatedAt: map['updatedAt'] != null
          ? map['updatedAt'] as Timestamp
          : Timestamp.fromMillisecondsSinceEpoch(0),
      name: map['name'] != null ? map['name'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WUser.fromJson(String source) =>
      WUser.fromMap(json.decode(source) as Map<String, dynamic>);

  factory WUser.defaultUser({
    required String name,
    required String username,
    required String email,
    String? avatar,
  }) =>
      WUser(
        id: const Uuid().v4(),
        name: name,
        avatar: avatar,
        username: username,
        email: email,
        createdAt: Timestamp.now(),
        updatedAt: Timestamp.now(),
      );

  factory WUser.empty() => WUser(
        id: "",
        name: "",
        avatar: "",
        username: "",
        email: "",
      );
}
