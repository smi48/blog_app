import 'dart:convert';

import 'category_model.dart';

CategoriesModel categoriesModelFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) =>
    json.encode(data.toJson());

class CategoriesModel {
  List<String> validationErrors;
  bool hasError;
  String? message;
  List<CategoryModel> data;
  CategoriesModel({
    required this.validationErrors,
    this.hasError = false,
    this.message,
    required this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        validationErrors:
            List<String>.from(json["ValidationErrors"].map((x) => x)),
        hasError: json["HasError"],
        message: json["Message"],
        data: List<CategoryModel>.from(
            json["Data"].map((x) => CategoryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ValidationErrors": List<dynamic>.from(validationErrors.map((x) => x)),
        "HasError": hasError,
        "Message": message,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
