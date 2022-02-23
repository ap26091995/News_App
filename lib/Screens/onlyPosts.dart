
import 'package:flutter/material.dart';
import 'package:morbimirror/ApiCall/All_URLS.dart';
import 'package:morbimirror/ApiCall/Post_api.dart';
import 'package:morbimirror/CustomFile/CustomBottomBar.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/CustomTextHeadingOftheBanner.dart';
import 'package:morbimirror/CustomFile/CustomtextTitle.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Posts.dart';
import 'package:morbimirror/widgets/MajorPost.dart';

class OnlyPosts extends StatefulWidget {

  String catId;
  List<Posts> posts;
  OnlyPosts({this.posts,this.catId});

  @override
  _OnlyPostsState createState() => _OnlyPostsState();
}

class _OnlyPostsState extends State<OnlyPosts> {
  int CurrentPage=2;

  getPost() async {
    List<Posts> myPostsListAdd = new List();
    print("|||||||||| GETTING POSTS FOR ID |||||||||||   ${Global.selectedCategoryId}");

    myPostsListAdd = await getPosts(
        url: "${BaseURL}wp-json/wp/v2/get_cat_posts/?category=${widget.catId}&page=$CurrentPage");

    if(myPostsListAdd!=null) {
      widget.posts = widget.posts + myPostsListAdd;
    }

    CurrentPage++;
    setState(() {
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    return  NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {

          getPost();

          return false;
        },
      child: ListView.builder(
        padding: EdgeInsets.zero,
          itemCount: widget.posts.length
          ,itemBuilder: (context,index){
        return index==0?MajorPost(posts: widget.posts[index],):MinorPost(widget.posts[index]);
      }),
    );
  }
}
