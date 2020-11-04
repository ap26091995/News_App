import 'package:flutter/material.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Posts.dart';

class searching extends StatefulWidget {
  @override
  _searchingState createState() => _searchingState();
}

class _searchingState extends State<searching> {
  final TextEditingController _controller = new TextEditingController();

  final String apiUrl = "https://morbimirror.com/wp-json/wp/v2/";
  List posts;
  Posts post;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Container(
                  child: TextField(
                    controller: _controller,
                    decoration: new InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      filled: true,
                      fillColor: staticWhite,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: staticWhite),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: staticBlack)),
                      hintText: 'Search',
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),

              onTap: (){
                print("searchposts");
                //searchPosts();
              }
            ),
          ],
        ),
        backgroundColor: staticBlue,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Global.activePost = post;
              Navigator.of(context).pushNamed('Homenewspagemain');
            },
            child: Card(
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Center(
                              child:Container(
                                height: MediaQuery.of(context).size.width*0.25,
                                width: MediaQuery.of(context).size.width*0.35,
                                decoration: BoxDecoration(borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(0.0),
                                  /*bottomRight: Radius.circular(50.0)*/),
                                  image: DecorationImage(
                                    image: NetworkImage(post.featuredMedia.medium),
                                    fit: BoxFit.fill,
                                  ),

                                ),
                              )
                          ),
                          SizedBox(width: 10,),
                          Container(width: 200,
                              child: Column(
                                children: [
                                  Text(post.title.rendered),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text(MyDate(post.date),),

                                    ],
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
