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
      width: MediaQuery.of(context).size.width * 0.55,
      child: SafeArea(
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              ListTile(onTap: (){

                Global.currentPageIndex = 1;

                refresh();
              },
                contentPadding:
                EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
                title: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new AssetImage("assets/images/logo.png"),
                              fit: BoxFit.contain,
                            ))),
                    SizedBox(
                      height: 5,
                    ),
ListTile(leading: Icon(Icons.home),
  title: Text("Home"),
),

                    ExpansionTile(leading: Icon(Icons.line_weight),
                      title: Text("News"),
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:MainAxisAlignment.start,
                            children: [
                              Text("Avsannondh & Besnu"),
                              SizedBox(height: 15),
                              Text("Birthday"),

                              SizedBox(height: 15),
                              Text("Halvad"),

                              SizedBox(height: 15),
                              Text("Maliya Miyana"),

                              SizedBox(height: 15),
                              Text("Morbi"),

                              SizedBox(height: 15),
                              Text("Promotional Article"),

                              SizedBox(height: 15),
                              Text("Tankara"),

                              SizedBox(height: 15),
                              Text("Wakaner"),
                              SizedBox(height: 15),
                            ],
                          ),
                        )

                      ],
                    ),
                    ExpansionTile(leading: Icon(Icons.line_weight),
                      title: Text("Gujarat"),
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:MainAxisAlignment.start,
                            children: [
                              Text("Ahmedabad"),
                              SizedBox(height: 15),
                              Text("Amreli"),

                              SizedBox(height: 15),
                              Text("Anand"),

                              SizedBox(height: 15),
                              Text("Aravalli"),

                              SizedBox(height: 15),
                              Text("Bharuch"),

                              SizedBox(height: 15),
                              Text("Bhavnagar"),

                              SizedBox(height: 15),
                              Text("Botad"),

                              SizedBox(height: 15),
                              Text("Chhita Udaipur"),
                              SizedBox(height: 15),

                              Text("Chhita Udaipur"),
                              SizedBox(height: 15),

                              Text("Chhita Udaipur"),
                              SizedBox(height: 15),

                              Text("Chhita Udaipur"),
                              SizedBox(height: 15),

                              Text("dahod"),
                              SizedBox(height: 15),

                              Text("Dang"),
                              SizedBox(height: 15),

                              Text("Dwarka"),
                              SizedBox(height: 15),

                              Text("Gir Somnath"),
                              SizedBox(height: 15),

                            ],
                          ),
                        )

                      ],
                    ),

                    ListTile(leading: Icon(Icons.line_weight),
                      title: Text("India"),
                    ),

                    ListTile(leading: Icon(Icons.line_weight),
                      title: Text("World"),
                    ),

                    ListTile(leading: Icon(Icons.line_weight),
                      title: Text("Astrology"),
                    ),

                    ListTile(leading: Icon(Icons.line_weight),
                      title: Text("Bollywood"),
                    ),

                    ListTile(leading: Icon(Icons.line_weight),
                      title: Text("Featured"),
                    ),

                    ListTile(leading: Icon(Icons.style),
                      title: Text("Lifestyle"),
                    ),

                    ListTile(leading: Icon(Icons.games),
                      title: Text("Sports"),
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