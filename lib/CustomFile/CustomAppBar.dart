import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            GestureDetector(onTap: (){
         clickonmenuicon();

            },
                child: Icon(Icons.menu,color: staticBlack,)),
            Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed('test');
              },
              child: Image.asset(logoimg, height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),

            Spacer(),
          /*  GestureDetector(
                onTap: (){

                  Navigator.of(context).pushNamed('search');
                },child: Icon(Icons.search,color: staticBlack,))*/

          ],
        ),
      ),
    );
  }
}