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

  String? parentCatName;
  int? parentCatId;
  List<Posts>? posts;
  List<Category>? category;

  MainCatModel.fromJson(Map<String, dynamic> json) {
    parentCatName = json['parent_cat_name'];
    parentCatId = json['parent_cat_id'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parent_cat_name'] = this.parentCatName;
    data['parent_cat_id'] = this.parentCatId;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String? catName;
  int? catId;
  List<Posts>? posts;

  Category({this.catName, this.catId, this.posts});

  Category.fromJson(Map<String, dynamic> json) {
    catName = json['cat_name'];
    catId = json['cat_id'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_name'] = this.catName;
    data['cat_id'] = this.catId;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
