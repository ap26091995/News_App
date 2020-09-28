import 'package:flutter/material.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/CustomTextHeadingOftheBanner.dart';
import 'package:morbimirror/CustomFile/CustomtextTitle.dart';

class MinorPost extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      Navigator.of(context).pushNamed('Homenewspagemain');
    },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0,8,8,0),
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
                                image: AssetImage('assets/images/bg.jpg'),
                                fit: BoxFit.fill,
                              ),

                            ),
                          )
                      ),
                      SizedBox(width: 10,),
                      Container(width: 200,
                          child: Column(
                            children: [
                              Text(""),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text("3rd sep"),
                                  Spacer(),
                                  Text("11:45 pm"),
                                  SizedBox(width: 10,)
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
  }
}


class MajorPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: GestureDetector(
        onTap: (){

          Navigator.of(context).pushNamed('Homenewspagemain');
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .3,
          decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: new DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Spacer(flex: 2,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 15,10),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Customtextheader(title: "Morbi",
                          titleclr: staticWhite,
                          bgcolor: Colors.black,),

                        SizedBox(height: 5,),

                        customtext(title: "મોરબીમાં કન્યા છાત્રાલય રોડ પર ભરાતા પાણીનો નિકાલ કરવા ચીફ ઓફિસરને રજુઆત",
                          titleclr: staticWhite,),

                        SizedBox(height: 5,),


                        Text("Morbi Mirror - Sepetember 7,2020 8:09 pm",
                          style: TextStyle(
                              color: staticWhite,fontSize: 10
                          ),),
                      ],
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
