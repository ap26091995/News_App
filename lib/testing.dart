import 'package:flutter/material.dart';
import 'package:morbimirror/ApiCall/All_URLS.dart';
import 'package:morbimirror/ApiCall/Category_api.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Category.dart';
import 'package:morbimirror/Models/Posts.dart';
import 'package:morbimirror/Models/appdata.dart';
import 'package:morbimirror/Screens/onlyPosts.dart';
import 'package:morbimirror/widgets/MajorPost.dart';
import 'package:morbimirror/widgets/PageContent.dart';

import 'ApiCall/Post_api.dart';

class Testing extends StatefulWidget {
  int? id;
  int? index;
  String? catId;
  Testing({this.id, this.index, this.catId});

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  bool? isLoading = false;
  List<CategoryForMenu>? myCategories = [];
  List<List<Posts>?>? myPostsList = [];
  List<Posts>? myPosts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getCat();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Global.mainDataList![widget.index!].category==null
              ? OnlyPosts(catId: Global.mainDataList![widget.index!].parentCatId.toString(), posts: Global.mainDataList![widget.index!].posts)
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      CategoryContent(posts: myPosts),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: Global.mainDataList![widget.index!].category!.length,
                          itemBuilder: (context, index) {
                            return PostForCategory(
                              postsList: Global.mainDataList![widget.index!].category![index].posts,
                              categoryTitle: Global.mainDataList![widget.index!].category![index].catName,
                              catId: Global.mainDataList![widget.index!].parentCatId,
                            );
                          }),
                    ],
                  ),
                ),
    );
  }
}
