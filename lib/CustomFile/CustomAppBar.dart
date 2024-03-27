import 'package:flutter/material.dart';
import 'package:morbimirror/CustomFile/Common.dart';
import 'package:morbimirror/Global/Global.dart';

import '../testing.dart';
import 'CustomColorsFile.dart';

class CustomAppBar extends StatelessWidget {
  final String? logoimg;
  final VoidCallback? clickonmenuicon;
  final VoidCallback? clickonsearchicon;

  CustomAppBar({
    this.clickonmenuicon,
    this.clickonsearchicon,
    this.logoimg,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> myTabBars = [];

    GetPageData() {
      for (int i = 0; i < Global.menu.length; i++) {
        myTabBars.add(Testing(
          id: int.parse(Global.menu[i].objectId!),
          index: i,
          catId: Global.menu[i].objectId!,
        ));
      }
    }

    return SafeArea(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            GestureDetector(
                onTap: () {
                  clickonmenuicon!();
                },
                child: Icon(
                  Icons.menu,
                  color: staticBlack,
                )),
            Opacity(
              opacity: 0,
              child: Container(
                  child: Icon(
                Icons.search,
                color: staticBlack,
              )),
            ),
            SizedBox(
              width: 10,
            ),
            Opacity(
              opacity: 0,
              child: Container(
                  child: Icon(
                Icons.refresh,
                color: staticBlack,
              )),
            ),
            Spacer(),
            Container(
              child: Image.asset(
                logoimg!,
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),
            Spacer(),
            Opacity(
              opacity: clickonsearchicon == null ? 0 : 1,
              child: GestureDetector(
                  onTap: clickonsearchicon ?? () {},
                  child: Icon(
                    Icons.share,
                    color: staticBlack,
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'search');
                print("search");
              },
              child: Container(
                  child: Icon(
                Icons.search,
                color: staticBlack,
              )),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                GetPageData();
                Show_toast_Now("Data Refreshing", Colors.green);
                print("refresh data");
              },
              child: Container(
                  child: Icon(
                Icons.refresh,
                color: staticBlack,
              )),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBarWithHeart extends StatelessWidget {
  final String? logoimg;
  final VoidCallback? clickonmenuicon;
  final VoidCallback? clickonsearchicon;
  final VoidCallback? onFav;
  final bool showIsMenu;

  CustomAppBarWithHeart(
      {this.clickonmenuicon, this.clickonsearchicon, this.logoimg, this.onFav, this.showIsMenu=true});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            showIsMenu==true?
            GestureDetector(
                onTap: () {
                  clickonmenuicon!();
                },
                child: Icon(
                  Icons.menu,
                  color: staticBlack,
                )):SizedBox(),
            showIsMenu==true? Opacity(
              opacity: 0,
              child: Icon(
                Icons.favorite_border,
                color: staticBlack,
              ),
            ):SizedBox(),
            SizedBox(width: 10),
            Spacer(),
            Container(
              child: Image.asset(
                logoimg!,
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),
            Spacer(),
            GestureDetector(
                onTap: onFav ?? () {},
                child: Icon(
                  Global.bookMarkPosts.contains(Global.activePost)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: staticBlack,
                )),
            SizedBox(width: 10),
            Opacity(
              opacity: clickonsearchicon == null ? 0 : 1,
              child: GestureDetector(
                  onTap: clickonsearchicon ?? () {},
                  child: Icon(
                    Icons.share,
                    color: staticBlack,
                  )),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}

/*
class CustomAppBarWithHeartSearchPage extends StatelessWidget {
  final String logoimg;
  final VoidCallback clickonmenuicon;
  final VoidCallback clickonsearchicon;
  final VoidCallback onFav;

  CustomAppBarWithHeartSearchPage(
      {this.clickonmenuicon, this.clickonsearchicon, this.logoimg, this.onFav});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            GestureDetector(
                onTap: () {
                  clickonmenuicon();
                },
                child: Icon(
                  Icons.menu,
                  color: staticBlack,
                )),
            Opacity(
              opacity: 0,
              child: Icon(
                Icons.favorite_border,
                color: staticBlack,
              ),
            ),
            SizedBox(width: 10),
            Spacer(),
            Container(
              child: Image.asset(
                logoimg,
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),
            Spacer(),
            GestureDetector(
                onTap: onFav ?? () {},
                child: Icon(
                  Global.bookMarkSearchPosts.contains(Global.searchPost)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: staticBlack,
                )),
            SizedBox(width: 10),
            Opacity(
              opacity: clickonsearchicon == null ? 0 : 1,
              child: GestureDetector(
                  onTap: clickonsearchicon ?? () {},
                  child: Icon(
                    Icons.share,
                    color: staticBlack,
                  )),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
*/
