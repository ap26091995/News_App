import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:morbimirror/CustomFile/CustomAppBar.dart';
import 'package:morbimirror/CustomFile/CustomBottomBar.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/CustomTextHeadingOftheBanner.dart';
import 'package:morbimirror/CustomFile/Customdrawer.dart';
import 'package:morbimirror/CustomFile/CustomtextTitle.dart';
import 'package:http/http.dart' as http;
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/widgets/PageContent.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final String apiUrl = "https://morbimirror.com/wp-json/wp/v2/";
  // Empty list for our posts
  List posts;
  // Function to fetch list of posts
  Future<String> getPosts() async {
    var res = await http.get(Uri.encodeFull(apiUrl + "posts?_embed"), headers: {"Accept": "application/json"});
    // fill our posts list with results and update state
    setState(() {
      var resBody = json.decode(res.body);
      posts = resBody;
    });
    return "Success!";
  }
  @override
  void initState() {
    super.initState();
//    this.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: DefaultTabController(
        length: Global.myTabs.length,
        child: Scaffold(
          appBar: AppBar(backgroundColor: staticWhite,
            title:CustomAppBar(logoimg: 'assets/images/logo.png',

            clickonmenuicon: (){

              _scaffoldKey.currentState.openDrawer();

            },),



            bottom: PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor:  Colors.black,
                    indicatorColor:staticBlue,
                    labelColor: staticBlue,
                    tabs: Global.myTabs),
                preferredSize: Size.fromHeight(30.0)),

          ),
          body: TabBarView(
            children: Global.categoryPosts.map((e) => CategoryContent(posts: e)).toList()
),



        ),
      ),

    );
  }
}
