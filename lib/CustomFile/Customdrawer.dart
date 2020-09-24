import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';


import 'Common.dart';

class CustomDrawer extends StatelessWidget {

  VoidCallback refresh;
  CustomDrawer({this.refresh});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      child: SafeArea(
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[

              ListTile(onTap: (){

                Global.currentPageIndex = 1;

                refresh();
              },
                contentPadding:
                EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
                title: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new AssetImage("assets/images/logo.png"),
                              fit: BoxFit.contain,
                            ))),
                    SizedBox(
                      height: 5,
                    ),
GestureDetector(onTap: (){
  Navigator.of(context).pushNamed('home');
},
  child:   ListTile(leading: Icon(Icons.home),

    title: Text("Home"),

  ),
),

                    ListTile(leading: Icon(Icons.bookmark),

                      title: Text("Bookmark"),

                    ),

                    ListTile(leading: Icon(Icons.category),

                      title: Text("Category"),onTap: (){

                      Navigator.of(context).pushNamed('drawer_category');
                      },

                    ),

                    ListTile(leading: Icon(Icons.outlined_flag),
                      title: Text("About Us"),
                    ),

                    ListTile(leading: Icon(Icons.security),
                      title: Text("Privacy Policy"),
                    ),

                    ListTile(leading: Icon(Icons.announcement),
                      title: Text("Faq"),
                    ),

                    ListTile(leading: Icon(Icons.share),
                      title: Text("Share This App"),
                    ),



                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}