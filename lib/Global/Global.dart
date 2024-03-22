import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:morbimirror/Models/Category.dart';
import 'package:morbimirror/Models/Menu.dart';
import 'package:morbimirror/Models/Page.dart';
import 'package:morbimirror/Models/Posts.dart';
import 'package:morbimirror/Models/appdata.dart';
import 'package:morbimirror/Models/main_cat_model.dart';
import 'package:morbimirror/widgets/PageContent.dart';

class Global {
  static int currentPageIndex = 0;
  static double iconSize = 0.07;
  static List<Tab> myTabs = [];
  static List<CategoryForMenu> CategoryList = [];
  static List<CategoryContent> categoryContent = [];
  static List<Menu> menu = [];
  static List<List<Posts>> categoryPosts = [];
  static List<List<List<Posts>>> subCategoryPosts = [];
  static List<Posts> testingPosts = [];
  static Posts? activePost;
  static List<Posts>? activeCategory;
  static List<AllData> allData = [];
  static int? selectedCategoryId;
  static PageData? privacyPolicPage;
  static PageData? faqPage;
  static PageData? aboutUsPage;
  static PageData? activePage;
  //static SearchPosts searchPost;

  static List<MainCatModel>? mainDataList = [];

  static List<Posts> bookMarkPosts = [];
  //static List<SearchPosts> bookMarkSearchPosts = [];
}

MyDate(DateTime dateTime) {
  return DateFormat('KK:mm a , dd-MM-yyyy ').format(dateTime);
}
