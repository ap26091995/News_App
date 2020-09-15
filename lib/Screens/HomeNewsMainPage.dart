import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:morbimirror/CustomFile/CustomAppBar.dart';
import 'package:morbimirror/CustomFile/CustomBottomBar.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/Customdrawer.dart';

class Newsmainpage extends StatefulWidget {
  @override
  _NewsmainpageState createState() => _NewsmainpageState();
}

class _NewsmainpageState extends State<Newsmainpage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( key: _scaffoldKey,
        drawer: CustomDrawer(),
        body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomAppBar(logoimg: 'assets/images/logo.png',
                  clickonmenuicon: (){
                  _scaffoldKey.currentState.openDrawer();

                },),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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


                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("મોરબીમાં કન્યા છાત્રાલય રોડ પર ભરાતા પાણીનો નિકાલ કરવા ચીફ ઓફિસરને રજુઆત",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,color: staticBlue,
                            fontFamily: 'Montserrat-Black'
                        ),),
                      SizedBox(height: 3,),
                      Row(
                        children: [
                          Text("Morbi Mirror",style: TextStyle(
                              fontWeight: FontWeight.w600,color: staticBlue
                          ),),
                          Spacer(),
                          Text("22.09.2020",style: TextStyle(
                              fontSize: 12,
                          ),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(

                        height: MediaQuery.of(context).size.height*0.70,
                        width: MediaQuery.of(context).size.width,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [


                            new Expanded(
                              flex: 1,
                              child: new SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                //.horizontal
                                child: new Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,\n \n and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                  textAlign: TextAlign.justify, style: new TextStyle(
                                    fontSize: 16.0,fontWeight: FontWeight.w500

                                ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),


                //shareicons

                SizedBox(height: 30,),

                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Neumorphic(style: NeumorphicStyle(
                        depth: 3,color: staticWhite
                    ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.save_alt,color: staticBlue,),
                        )),
                    SizedBox(width: 30,),
                    Neumorphic(style: NeumorphicStyle(
                        depth: 3,color: staticWhite
                    ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.share,color: staticBlue,),
                        )),
                    SizedBox(width: 30,),
                    Neumorphic(style: NeumorphicStyle(
                        depth: 3,color: staticWhite
                    ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite_border,color: staticBlue,),
                        )),
                  ],),
                ),


                customBottombar(
                  img: 'assets/images/logo.png',
                  title: "મોરબીવાસીઓ તમામ વિસ્તારોમની સચોટ અને તટસ્થ માહિતી હર પળ ઘરે બેઠા મળી રહે એ માટે મોરબીવાસીઓનું પોતાનું મોરબી મિરર શરૂ કરવાનો અમારો ધ્યેય છે જે ધ્યેય આપ સૌ મિત્રોના સાથ સહકારથી શ્રેષ્ઠતા સાથે કામયાબીના શિખરો સર કરશે જેના માટે મોરબી ગૌરવ અનુભવશે.",

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
