// To parse this JSON data, do
//
//     final mainCatModel = mainCatModelFromJson(jsonString);

import 'dart:convert';

import 'package:morbimirror/Models/Posts.dart';

MainCatModel mainCatModelFromJson(String str) => MainCatModel.fromJson(json.decode(str));

String mainCatModelToJson(MainCatModel data) => json.encode(data.toJson());

class MainCatModel {
  MainCatModel({
    this.parentCatName,
    this.parentCatId,
    this.category,
    this.posts,
  });

  String parentCatName;
  int parentCatId;
  List<Category> category;
  List<Posts> posts;

  factory MainCatModel.fromJson(Map<String, dynamic> json) => MainCatModel(
    parentCatName: json["parent_cat_name"],
    parentCatId: json["parent_cat_id"],
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    posts: json["posts"] == null ? null : List<Posts>.from(json["posts"].map((x) => Posts.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "parent_cat_name": parentCatName,
    "parent_cat_id": parentCatId,
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
    "posts": posts == null ? null : List<dynamic>.from(posts.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.catName,
    this.catId,
    this.posts,
  });

  String catName;
  int catId;
  List<Posts> posts;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    catName: json["cat_name"],
    catId: json["cat_id"],
    posts: List<Posts>.from(json["posts"].map((x) => Posts.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cat_name": catName,
    "cat_id": catId,
    "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
  };
}

