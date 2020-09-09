import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

import 'CustomTextHeadingOftheBanner.dart';


class customBottombar extends StatelessWidget {


  final String img;
  final String title;
  final Color titleclr;



  customBottombar({this.img, this.title, this.titleclr});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            Image.asset(img,width: 200,height: 150,),
            Text(title,textAlign: TextAlign.justify,style: TextStyle(
              color: titleclr,fontWeight: FontWeight.w600,

            ),),
            SizedBox(height: 10,),
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Customtextheader(title: "Stay Connected",titleclr: staticBlue,bgcolor: staticYellow,),
                  ],
                ),
                Divider(height: 1,color: staticYellow,thickness: 2,)
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                SocialMediaButton.linkedin(color: staticBlue,size: 30,),
                SocialMediaButton.facebook(url: '',color: staticBlue,size: 30,),
                SocialMediaButton.instagram(color: staticBlue,size: 30,),
                SocialMediaButton.twitter(color: staticBlue,size: 30,),
              ],
            ),

            SizedBox(height: 10,),
            Text("© 2020 Morbi Mirror. All rights reserved.")

          ],
        ),
      ),
    );
  }
}
