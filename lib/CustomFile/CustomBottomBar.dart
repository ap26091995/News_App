import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';

import 'CustomTextHeadingOftheBanner.dart';

class customBottombar extends StatelessWidget {
  final String? img;
  final String? title;
  final Color? titleclr;

  customBottombar({this.img, this.title, this.titleclr});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          children: [
            Image.asset(
              img!,
              width: 200,
              height: 150,
            ),
            Text(
              title!,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: titleclr,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Customtextheader(
                      title: "Stay Connected",
                      titleclr: staticWhite,
                      bgcolor: staticDarkblue,
                    ),
                  ],
                ),
                Divider(
                  height: 1,
                  color: staticDarkblue,
                  thickness: 2,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
/*
                SocialMediaButton.youtube(url: 'https://www.youtube.com/channel/UCSjQi-WHNOoW5XrPLAM30LQ',color: staticBlue,size: 30,),
                SocialMediaButton.facebook(url: 'https://www.facebook.com/Morbi-Mirror-101701831652004',color: staticBlue,size: 30,),
                SocialMediaButton.instagram(url: 'https://www.instagram.com/morbimirror/',color: staticBlue,size: 30,),
                SocialMediaButton.twitter(url: 'https://twitter.com/MorbiMirror',color: staticBlue,size: 30,),*/
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("© ${DateTime.now().year} Morbi Mirror . All rights reserved.")
          ],
        ),
      ),
    );
  }
}
