import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  String id;
  String email;
  String? image;
  String? location;
  List<String>? favoriteBlogIds;
  UserModel({
    required this.id,
    required this.email,
    this.image,
    this.location,
    this.favoriteBlogIds,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? image,
    String? location,
    List<String>? favoriteBlogIds,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      image: image ?? this.image,
      location: location ?? this.location,
      favoriteBlogIds: favoriteBlogIds ?? this.favoriteBlogIds,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'image': image,
      'location': location,
      'favoriteBlogIds': favoriteBlogIds,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      image: map['image'],
      location: map['location'],
      favoriteBlogIds: List<String>.from(map['favoriteBlogIds']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, image: $image, location: $location, favoriteBlogIds: $favoriteBlogIds)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.email == email &&
        other.image == image &&
        other.location == location &&
        listEquals(other.favoriteBlogIds, favoriteBlogIds);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        image.hashCode ^
        location.hashCode ^
        favoriteBlogIds.hashCode;
  }
}
