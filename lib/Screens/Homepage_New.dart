import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:morbimirror/CustomFile/CustomAppBar.dart';
import 'package:morbimirror/CustomFile/CustomBottomBar.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/CustomTextHeadingOftheBanner.dart';
import 'package:morbimirror/CustomFile/Customdrawer.dart';
import 'package:morbimirror/CustomFile/CustomtextTitle.dart';
import 'package:http/http.dart' as http;
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/testing.dart';
import 'package:morbimirror/widgets/PageContent.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  List<Widget> myTabBars = [];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // Empty list for our posts
  List? posts;
  // Function to fetch list of posts
  @override
  void initState() {
    GetPageData();
    super.initState();
//    this.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: Global.mainDataList!.length,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: CustomDrawer(),
          body: Column(
            children: [
              CustomAppBar(logoimg: 'assets/images/logo.png',

                clickonmenuicon: (){

                  _scaffoldKey.currentState!.openDrawer();

                },),
              TabBar(tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  unselectedLabelColor:  Colors.black,
                  indicatorColor:staticBlue,
                  labelColor: staticBlue,
                  tabs: Global.myTabs),
              Expanded(
                child: TabBarView(
                  children:myTabBars
),
              ),
            ],
          ),
      ),

    );
  }


  GetPageData(){
    print("DATA:${Global.mainDataList}");

    print("Length:${Global.mainDataList!.length}");
    for(int i =0;i<Global.mainDataList!.length;i++){
      myTabBars.add(Testing(id: Global.mainDataList![i].parentCatId,index: i,catId: Global.mainDataList![i].parentCatId.toString(),));
    }
    print("My Tab Bar Pages : ${myTabBars.length}");
  }


}
