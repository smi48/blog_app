// To parse this JSON data, do
//
//     final blogsModel = blogsModelFromJson(jsonString);

import 'dart:convert';

import 'blog_model.dart';

BlogsModel blogsModelFromJson(String str) =>
    BlogsModel.fromJson(json.decode(str));

String blogsModelToJson(BlogsModel data) => json.encode(data.toJson());

class BlogsModel {
  BlogsModel({
    required this.validationErrors,
    this.hasError = false,
    this.message,
    required this.data,
  });

  List<dynamic> validationErrors;
  bool hasError;
  dynamic message;
  List<BlogModel> data;

  factory BlogsModel.fromJson(Map<String, dynamic> json) => BlogsModel(
        validationErrors:
            List<dynamic>.from(json["ValidationErrors"].map((x) => x)),
        hasError: json["HasError"],
        message: json["Message"],
        data: List<BlogModel>.from(
            json["Data"].map((x) => BlogModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ValidationErrors": List<dynamic>.from(validationErrors.map((x) => x)),
        "HasError": hasError,
        "Message": message,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
