// ignore_for_file: unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseModel {
  String id;
  Timestamp? createdAt;
  Timestamp? updatedAt;
  BaseModel({this.id = '', this.createdAt, this.updatedAt}) {
    Timestamp createAt = Timestamp.now();
    this.createdAt = this.createdAt ?? createAt;
  }
}
