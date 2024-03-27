import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:morbimirror/BookMark/bookMark.dart';
import 'package:morbimirror/CustomFile/CustomAppBar.dart';
import 'package:morbimirror/CustomFile/CustomBottomBar.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/Customdrawer.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:share/share.dart';

class Newsmainpage extends StatefulWidget {
  @override
  _NewsmainpageState createState() => _NewsmainpageState();
}

class _NewsmainpageState extends State<Newsmainpage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(),
        appBar: AppBar(
          title:CustomAppBarWithHeart(
            showIsMenu: false,
            onFav: () {
              if (Global.bookMarkPosts.contains(Global.activePost)) {
                removeBookMark(Global.activePost!);
              } else {
                SaveBookMark(Global.activePost!);
              }

              setState(() {});
            },
            logoimg: 'assets/images/logo.png',
            clickonmenuicon: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            clickonsearchicon: () {
              Share.share("${Global.activePost!.postTitle}\n${Global.activePost!.link}\n\nhttps://play.google.com/store/apps/details?id=com.morbimirror ");
            },
          ) ,
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .3,
                        decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: new DecorationImage(
                              image: NetworkImage(Global.activePost!.featuredMedia!.medium!),
                              fit: BoxFit.cover,
                            )),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Global.activePost!.postTitle!.replaceAll("&#8211", ""),
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: staticBlack, fontFamily: 'Montserrat-Black'),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Text(
                                "News 12 Paper ",
                                style: TextStyle(fontWeight: FontWeight.w600, color: staticBlue),
                              ),
                              Spacer(),
                              // Text(
                              //   Global.activePost!.postDate!,
                              //   style: TextStyle(
                              //     fontSize: 12,
                              //   ),
                              // )
                              Text(
                                MyDate(Global.activePost!.postDate!),
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                new Html(
                                  data: Global.activePost!.postContent ??
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,\n \n and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                  style: {
                                    "p": Style(textAlign: TextAlign.justify, fontSize: FontSize.large),
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              customBottombar(
                img: 'assets/images/logo.png',
                title:
                "",
              )
            ],
          ),
        ),
      ),
    );
  }
}
