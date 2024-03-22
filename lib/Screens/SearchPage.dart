import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:morbimirror/ApiCall/All_URLS.dart';
import 'package:morbimirror/CustomFile/Common.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Posts.dart';
import 'package:morbimirror/Screens/Searched_Data.dart';

class searching extends StatefulWidget {
  @override
  _searchingState createState() => _searchingState();
}

class _searchingState extends State<searching> {
  final TextEditingController _controller = new TextEditingController();

  final String apiUrl = "${BaseURL}wp-json/wp/v2/";
  final String searchurl = "${BaseURL}wp-json/wp/v2/search_posts/?search=";
  Posts? post;

  bool isLoaded = false;
  bool isSearched = false;

  List<Posts> searchResults = [];

  getPosts() async {
    var res = await http.get(Uri.parse(Uri.encodeFull(apiUrl + "posts?_embed")),
        headers: {"Accept": "application/json",'Authorization': "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsIm5hbWUiOiJuZXdzYXBwIiwiaWF0IjoxNzEwOTI3Mzk0LCJleHAiOjE4Njg2MDczOTR9.MX47pZmyuwPVDCKyrPWcM0-sU3xZATVFXmNnkOaiECY"});
    // fill our posts list with results and update state
    setState(() {
      var resBody = json.decode(res.body);
      post = Posts.fromJson(resBody);
      isLoaded = true;
    });
    return "Success!";
  }

  void searchposts() async {
    if (_controller.text.isNotEmpty) {
      setState(() {
        isSearched = true;
        isLoaded = false;
      });
      var res = await http.get(
          Uri.parse(Uri.encodeFull(searchurl + _controller.text.trim())),
          headers: {"Accept": "application/json",'Authorization': "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsIm5hbWUiOiJuZXdzYXBwIiwiaWF0IjoxNzEwOTI3Mzk0LCJleHAiOjE4Njg2MDczOTR9.MX47pZmyuwPVDCKyrPWcM0-sU3xZATVFXmNnkOaiECY"});
      // fill our posts list with results and update state

      print(res.body);
      setState(() {
        print("Searched Data");
        var resBody = json.decode(res.body);

        searchResults = (resBody["posts"] as List)
            .map((data) => Posts.fromJson(data))
            .toList();
        /* resBody.forEach((element) {
          searchResults.add(Posts.fromJson(element));
        });*/

        isLoaded = true;
      });
    } else {
      Show_toast_Now("Enter search term", Colors.red);
    }
  }

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
                onTap: () {
                  print("searchposts");
                  searchposts();
                }),
          ],
        ),
        backgroundColor: staticBlue,
      ),
      body: Container(
          child: isLoaded
              ? Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Search Results",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: searchResults.isEmpty
                          ? Text("No Result Found")
                          : searchResults.length > 0
                              ? ListView.builder(
                                  itemCount: searchResults.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Global.activePost =
                                            searchResults[index];
                                        //print(Global.activePost.id);

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) => Datasearched(
                                                    searchResults[index].id)));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8.0, 8, 8, 0),
                                        child: Card(
                                          child: Row(
                                            children: <Widget>[
                                              Column(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Center(
                                                          child: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.25,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.35,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0), /*bottomRight: Radius.circular(50.0)*/
                                                          ),
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                                searchResults[
                                                                        index]
                                                                    .featuredMedia!
                                                                    .medium!),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      )),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                          width: 200,
                                                          child: Column(
                                                            children: [
                                                              Text(searchResults[
                                                                      index]
                                                                  .postTitle!),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                children: [
                                                              //     Text(
                                                              // searchResults[index].postDate!,
                                                              //       style: TextStyle(
                                                              //         fontSize: 12,
                                                              //       ),
                                                              //     )
                                                                  Text(
                                                                    MyDate(searchResults[
                                                                            index]
                                                                        .postDate!),
                                                                  ),
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
                                    );
                                  })
                              : Center(child: Text("No News found")),
                    )
                  ],
                )
              : Center(
                  child: isSearched ? CircularProgressIndicator() : Container(),
                )),
    );
  }
}
