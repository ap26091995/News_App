import 'package:flutter/material.dart';
import 'package:morbimirror/CustomFile/CustomAppBar.dart';
import 'package:morbimirror/CustomFile/CustomBottomBar.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/CustomTextHeadingOftheBanner.dart';
import 'package:morbimirror/CustomFile/Customdrawer.dart';
import 'package:morbimirror/CustomFile/CustomtextTitle.dart';

class CategoryNews extends StatefulWidget {
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(  drawer: CustomDrawer(),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(logoimg: 'assets/images/logo.png',clickonmenuicon: (){
                _scaffoldKey.currentState.openDrawer();

              },),
//header card
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .4,
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
                                Customtextheader(title: "Ahmedabad",
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

//title

              SizedBox( height: 40,),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Customtextheader(title: "Most Read",titleclr: staticBlue,bgcolor: staticDarkblue,),
                      ],
                    ),
                    Divider(height: 1,color: staticDarkblue,thickness: 2,)
                  ],
                ),
              ),

              SizedBox( height: 10,),

              //listview
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .5,
                child: GestureDetector(
                  onTap: (){

                    Navigator.of(context).pushNamed('Homenewspagemain');
                  },
                  child: new ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 10,),
                              GestureDetector(onTap: (){
                                //Navigator.of(context).pushNamed('newsdetailpage');
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
                                                    height: MediaQuery.of(context).size.height*0.2,
                                                    width: MediaQuery.of(context).size.height*0.18,
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(0.0),
                                                      /*bottomRight: Radius.circular(50.0)*/),
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/bg2.jpg'),
                                                        fit: BoxFit.fill,
                                                      ),

                                                    ),
                                                  )
                                              ),
                                              SizedBox(width: 10,),
                                              Container(width: 200,
                                                  child: Column(
                                                    children: [
                                                      Text("મોરબી એસીબીએ એક હજારની લાંચમાં પકડાયેલા સર્કલ ઓફિસરને કોર્ટમાં રજૂ કરતા કોર્ટે ત્રણ દિવસના રીમાન્ડ મંજુર કર્યા."),
                                                      SizedBox(height: 10,),
                                                      Row(
                                                        children: [
                                                          Text("3 September,"),
                                                          Spacer(),
                                                          Text("11:45 pm")
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
                      }),
                ),
              ),


              customBottombar(
                img: 'assets/images/logo.png',
                title: "મોરબીવાસીઓ તમામ વિસ્તારોમની સચોટ અને તટસ્થ માહિતી હર પળ ઘરે બેઠા મળી રહે એ માટે મોરબીવાસીઓનું પોતાનું મોરબી મિરર શરૂ કરવાનો અમારો ધ્યેય છે જે ધ્યેય આપ સૌ મિત્રોના સાથ સહકારથી શ્રેષ્ઠતા સાથે કામયાબીના શિખરો સર કરશે જેના માટે મોરબી ગૌરવ અનુભવશે.",

              )
            ],
          ),
        ),
      ),
    );
  }
}
