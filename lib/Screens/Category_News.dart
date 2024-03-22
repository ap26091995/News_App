import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:morbimirror/ApiCall/All_URLS.dart';
import 'package:morbimirror/ApiCall/Post_api.dart';
import 'package:morbimirror/CustomFile/CustomAppBar.dart';
import 'package:morbimirror/CustomFile/CustomBottomBar.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/CustomTextHeadingOftheBanner.dart';
import 'package:morbimirror/CustomFile/Customdrawer.dart';
import 'package:morbimirror/CustomFile/CustomtextTitle.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Posts.dart';
import 'package:morbimirror/widgets/MajorPost.dart';
import 'package:morbimirror/widgets/PageContent.dart';

class CategoryNews extends StatefulWidget {
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  bool isLoading = true;
  int CurrentPage=1;


  List<Posts> myPostsList = [];

  getPost() async {
    List<Posts> myPostsListAdd = [];
    print("|||||||||| GETTING POSTS FOR ID |||||||||||   ${Global.selectedCategoryId}");
    log("URL IS${BaseURL}wp-json/wp/v2/posts?categories=${Global.selectedCategoryId}&page=$CurrentPage");
    myPostsListAdd = (await getPosts(
        url: "${BaseURL}wp-json/wp/v2/posts?categories=${Global.selectedCategoryId}&page=$CurrentPage"))!;


    if(myPostsListAdd!=null) {
      myPostsList = myPostsList + myPostsListAdd;
    }
    isLoading = false;
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

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(  drawer: CustomDrawer(),
      key: _scaffoldKey,
      body: isLoading?
      Center(child: SizedBox(width: 100,height: 100,child: CircularProgressIndicator(),)):Column(
        children: [
          CustomAppBar(logoimg: 'assets/images/logo.png',
            clickonmenuicon: (){
              _scaffoldKey.currentState!.openDrawer();
            },),
          Expanded(child:

          NotificationListener<ScrollEndNotification>(
              onNotification: (notification) {
                print("category");
                getPost();

            return false;
          },child: ListView.builder(

              itemCount: myPostsList.length
              ,itemBuilder: (context,index){
                print("INDESSSS:$index");
            return index==0?MajorPost(posts: myPostsList[index],):MinorPost(myPostsList[index]);
          })

          ))
        ],
      ),
    );
  }
}
