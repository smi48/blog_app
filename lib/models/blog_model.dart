// To parse this JSON data, do
//
//     final blogModel = blogModelFromJson(jsonString);

import 'dart:convert';

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));

String blogModelToJson(BlogModel data) => json.encode(data.toJson());

class BlogModel {
  String title;
  String content;
  String image;
  String categoryId;
  String id;

  BlogModel({
    required this.title,
    required this.content,
    required this.image,
    required this.categoryId,
    required this.id,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        title: json["Title"],
        content: json["Content"],
        image: json["Image"],
        categoryId: json["CategoryId"],
        id: json["Id"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Content": content,
        "Image": image,
        "CategoryId": categoryId,
        "Id": id,
      };
}
