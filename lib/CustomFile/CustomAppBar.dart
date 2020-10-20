import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:morbimirror/Global/Global.dart';

import 'CustomColorsFile.dart';

class CustomAppBar extends StatelessWidget {
  final String logoimg;
  final VoidCallback clickonmenuicon;
  final VoidCallback clickonsearchicon;


  CustomAppBar(
      {this.clickonmenuicon,
        this.clickonsearchicon,
        this.logoimg,
        });


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(width: 20,),
            GestureDetector(onTap: (){
         clickonmenuicon();

            },
                child: Icon(Icons.menu,color: staticBlack,)),
            Spacer(),
            Container(
              child: Image.asset(logoimg, height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),

            Spacer(),
            Opacity(
              opacity:clickonsearchicon==null?0:1,
              child: GestureDetector(
                  onTap: clickonsearchicon??(){

                  },child: Icon(Icons.share,color: staticBlack,)),
            ),
            SizedBox(width: 20,),

          ],
        ),
      ),
    );
  }
}


class CustomAppBarWithHeart extends StatelessWidget {
  final String logoimg;
  final VoidCallback clickonmenuicon;
  final VoidCallback clickonsearchicon;
  final VoidCallback onFav;


  CustomAppBarWithHeart(
      {this.clickonmenuicon,
        this.clickonsearchicon,
        this.logoimg,
        this.onFav
      });


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(width: 20,),
            GestureDetector(onTap: (){
              clickonmenuicon();

            },
                child: Icon(Icons.menu,color: staticBlack,)),
            Opacity(
              opacity: 0,
              child: Icon(Icons.favorite_border,color: staticBlack,),
            ),
            SizedBox(width: 10),

            Spacer(),
            Container(
              child: Image.asset(logoimg, height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),

            Spacer(),
            GestureDetector(
                onTap: onFav??(){
                },child: Icon(Global.bookMarkPosts.contains(Global.activePost)? Icons.favorite: Icons.favorite_border,color: staticBlack,)),
            SizedBox(width: 10),
            Opacity(
              opacity:clickonsearchicon==null?0:1,
              child: GestureDetector(
                onTap: clickonsearchicon??(){

                },child: Icon(Icons.share,color: staticBlack,)),
            ),
            SizedBox(width: 20,),

          ],
        ),
      ),
    );
  }
}