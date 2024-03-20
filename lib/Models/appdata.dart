import 'package:morbimirror/Models/Category.dart';
import 'package:morbimirror/Models/Posts.dart';

class AllData{

  List<CategoryForMenu>? myCategories = [];
  List<List<Posts>?>? myPostsList = [];
  List<Posts>? myPosts = [];

  AllData({this.myCategories, this.myPostsList, this.myPosts});
}