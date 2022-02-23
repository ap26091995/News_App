

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

int id;
int index;
String catId;
Testing({this.id,this.index,this.catId});

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {



  bool isLoading =false;
  List<CategoryForMenu> myCategories = new List();
  List<List<Posts>> myPostsList = new List();
  List<Posts> myPosts = new List();


  @override
  void initState() {
    // TODO: implement initState
   super.initState();
  // getCat();
  }

  getCat() async {

    print("Pulling Categories for id ${widget.id}");

    if( Global.allData[widget.index]==null) {
      myCategories.clear();
      myPostsList.clear();
      myCategories = await getCategoriesFromURL(
          Url: urlForTopBarSubCategories + widget.id.toString());

      if (myCategories.isEmpty) {
        print("Pulling Posts for id ${widget.id}");
        myPosts = await getPosts(
            url: "${BaseURL}wp-json/wp/v2/posts?status=publish&order=desc&per_page=5&page=1&categories=${widget
                .id}");

        print("---- GOING FOR POSTS ------");
        print(myPosts.length);
      }
      else {

        for (int i = 0; i < myCategories.length; i++) {
          print("Pulling Categories for id ${widget.id} subcat id ${myCategories[i].id}");

          myPostsList.add(await getPosts(
              url: "${BaseURL}wp-json/wp/v2/posts?status=publish&order=desc&per_page=5&page=1&categories=${myCategories[i]
                  .id}"));
        }
        print("Pulling Posts for id ${widget.id}");
        myPosts = await getPosts(
            url: "${BaseURL}wp-json/wp/v2/posts?status=publish&order=desc&per_page=5&page=1&categories=${widget
                .id}");



      }

      isLoading = false;

      print("Category List Length : "+myCategories.length.toString());
      print("PostList List Length : "+myPostsList.length.toString());
      print("Post Length : "+myPosts.length.toString());

      Global.allData[widget.index] = AllData(myCategories: myCategories,
          myPosts: myPosts,
          myPostsList: myPostsList);

      setState(() {

      });
    }
    else{
      myPostsList=Global.allData[widget.index].myPostsList;
      myPosts=Global.allData[widget.index].myPosts;
      myCategories=Global.allData[widget.index].myCategories;
      isLoading = false;
      setState(() {

      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
    /*  isLoading?
      Center(child: SizedBox(width: 100,height: 100,child: CircularProgressIndicator(),)):
      myCategories.isEmpty?
      myPosts.isEmpty && myPostsList.isEmpty?Center(child: Text("No News Available..."),):*/



      Global.mainDataList[widget.index].category.isEmpty? OnlyPosts(catId:Global.mainDataList[widget.index].parentCatId.toString() ,posts: Global.mainDataList[widget.index].posts):
      SingleChildScrollView(
        child: Column(
          children: [
            CategoryContent(posts: myPosts),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,itemCount: Global.mainDataList[widget.index].category.length,
                itemBuilder: (context,index){
            return
              PostForCategory(postsList: Global.mainDataList[widget.index].category[index].posts,
                categoryTitle: Global.mainDataList[widget.index].category[index].catName,catId: Global.mainDataList[widget.index].parentCatId.toString(),);
                }),
          ],
        ),
      ),
    );
  }
}
