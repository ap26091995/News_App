import 'package:flutter/material.dart';
import 'package:morbimirror/Models/Category.dart';
import 'package:morbimirror/Models/Menu.dart';
import 'package:morbimirror/Models/Posts.dart';
import 'package:morbimirror/widgets/PageContent.dart';




class Global{
  static int currentPageIndex = 0;
  static double iconSize = 0.07;
  static List<Tab> myTabs = new List();
  static List<Category> CategoryList = new List();
  static List<CategoryContent> categoryContent = new List();
  static List<Menu> menu = new List();
  static List<List<Posts>> categoryPosts = new List();
  static List<List<List<Posts>>> subCategoryPosts = new List();
  static List<List<Category>> subCategoryList = new List();

}
