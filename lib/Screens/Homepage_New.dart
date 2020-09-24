import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:morbimirror/CustomFile/CustomAppBar.dart';
import 'package:morbimirror/CustomFile/CustomBottomBar.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/CustomFile/CustomTextHeadingOftheBanner.dart';
import 'package:morbimirror/CustomFile/Customdrawer.dart';
import 'package:morbimirror/CustomFile/CustomtextTitle.dart';
import 'package:http/http.dart' as http;

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final String apiUrl = "https://morbimirror.com/wp-json/wp/v2/";
  // Empty list for our posts
  List posts;
  // Function to fetch list of posts
  Future<String> getPosts() async {
    var res = await http.get(Uri.encodeFull(apiUrl + "posts?_embed"), headers: {"Accept": "application/json"});
    // fill our posts list with results and update state
    setState(() {
      var resBody = json.decode(res.body);
      posts = resBody;
    });
    return "Success!";
  }
  @override
  void initState() {
    super.initState();
    this.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(backgroundColor: staticWhite,
            title:CustomAppBar(logoimg: 'assets/images/logo.png',

            clickonmenuicon: (){
              _scaffoldKey.currentState.openDrawer();

            },),



            bottom: PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor:  Colors.black,
                    indicatorColor:staticBlue,
                    labelColor: staticBlue,
                    tabs: [
                      Tab(
                        child: Text('TOP NEWS',style: TextStyle(
                          color: Colors.red
                        ),),
                      ),
                      Tab(
                        child: Text('GUJARAT'),
                      ),
                      Tab(
                        child: Text('INDIA'),
                      ),
                      Tab(
                        child: Text('WORLD'),
                      ),
                      Tab(
                        child: Text('ASTROLOGY'),
                      ),
                    ]),
                preferredSize: Size.fromHeight(30.0)),

          ),
          body: TabBarView(
            children: <Widget>[

              SingleChildScrollView(
                child: Column(
                  children: [

                    SizedBox(height: 20,),
                    //header card
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Customtextheader(title: "Latest News",titleclr: staticWhite,bgcolor: staticDarkblue,),
                            ],
                          ),
                          Divider(height: 1,color: staticDarkblue,thickness: 2,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: GestureDetector(
                        onTap: (){

                          Navigator.of(context).pushNamed('Homenewspagemain');
                        },
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
                    ),

                    SizedBox(height: 20,),
                    //slider
                    CarouselSlider(items: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(onTap: (){

                          Navigator.of(context).pushNamed('Homenewspagemain');
                        },
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
                                          Customtextheader(title: "Morbi",
                                            titleclr: staticWhite,
                                            bgcolor: Colors.black,),

                                          SizedBox(height: 5,),

                                          Container(width: 240,
                                            child: customtext(title: "મોરબીમાં કન્યા છાત્રાલય રોડ પર ભરાતા પાણીનો નિકાલ કરવા ચીફ ઓફિસરને રજુઆત",
                                              titleclr: staticWhite,),
                                          ),

                                          SizedBox(height: 5,),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),


                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                      options: CarouselOptions(
                        autoPlay: false,
                        //enlargeCenterPage: true,
                        initialPage: 2,
                        //height: MediaQuery.of(context).size.height*0.2,

                      ),
                    ),

                    //morbi news

                    SizedBox( height: 40,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Customtextheader(title: "Morbi News",titleclr: staticWhite,bgcolor: staticDarkblue,),
                            ],
                          ),
                          Divider(height: 1,color: staticDarkblue,thickness: 2,)
                        ],
                      ),
                    ),

                    //  listview of morbinews

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .5,
                      child: new ListView.builder(
                          itemCount: 4,
                          itemBuilder: (BuildContext ctxt, int index) {
                            //wp.Post post = snapshot.data[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 10,),
                                  GestureDetector(onTap: (){
                                    Navigator.of(context).pushNamed('Homenewspagemain');
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
                                                          Text("મોરબીમાં જુદા જુદા ચાર બનાવોમાં ચાર વ્યક્તિઓ સારવાર હેઠળ : બે ના અપમૃત્યુ"),
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

                                ],
                              ),
                            );
                          }),
                    ),


                    //popular news

                    SizedBox( height: 40,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Customtextheader(title: "Popular News",titleclr: staticWhite,bgcolor: staticDarkblue,),
                            ],
                          ),
                          Divider(height: 1,color: staticDarkblue,thickness: 2,)
                        ],
                      ),
                    ),


                    //  listview of popularnews

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .5,
                      child: new ListView.builder(
                          itemCount:  posts == null ? 0 : posts.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 10,),
                                  GestureDetector(onTap: (){
                                    Navigator.of(context).pushNamed('Homenewspagemain');
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
                                                            image:NetworkImage(posts[index]["_embedded"]["wp:featuredmedia"][0]["source_url"]),
                                                            fit: BoxFit.fill,
                                                          ),

                                                        ),
                                                      )
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Container(width: 200,
                                                      child: Column(
                                                        children: [
                                                          Text(posts[index]["title"]["rendered"],maxLines: 4,),
                                                          SizedBox(height: 10,),
                                                          Row(
                                                            children: [
                                                              Customtextheader(bgcolor: staticBlack,
                                                                  titleclr: staticWhite,title: posts[index]["categories"].toString()),
                                                              Spacer(),
                                                              Text(posts[index]["date"].toString().split(' ')[0],
                                                                style: TextStyle(
                                                                    fontSize: 12
                                                                ),)
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

                    customBottombar(
                      img: 'assets/images/logo.png',
                      title: "મોરબીવાસીઓ તમામ વિસ્તારોમની સચોટ અને તટસ્થ માહિતી હર પળ ઘરે બેઠા મળી રહે એ માટે મોરબીવાસીઓનું પોતાનું મોરબી મિરર શરૂ કરવાનો અમારો ધ્યેય છે જે ધ્યેય આપ સૌ મિત્રોના સાથ સહકારથી શ્રેષ્ઠતા સાથે કામયાબીના શિખરો સર કરશે જેના માટે મોરબી ગૌરવ અનુભવશે.",

                    )],
                ),
              ),


              //tab 2

              SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: GestureDetector(
                        onTap: (){

                          Navigator.of(context).pushNamed('Homenewspagemain');
                        },
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
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .6,
                      child: new ListView.builder(
                          itemCount: 4,
                          itemBuilder: (BuildContext ctxt, int index) {
                            //wp.Post post = snapshot.data[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 10,),
                                  GestureDetector(onTap: (){
                                    Navigator.of(context).pushNamed('Homenewspagemain');
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
                                                          Text("મોરબીમાં જુદા જુદા ચાર બનાવોમાં ચાર વ્યક્તિઓ સારવાર હેઠળ : બે ના અપમૃત્યુ"),
                                                          SizedBox(height: 10,),
                                                          Row(
                                                            children: [
                                                              Text("3rd sep"),
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

                  ],
                ),
              ),

              //tab 3
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: GestureDetector(
                        onTap: (){

                          Navigator.of(context).pushNamed('Homenewspagemain');
                        },
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
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .6,
                      child: new ListView.builder(
                          itemCount: 4,
                          itemBuilder: (BuildContext ctxt, int index) {
                            //wp.Post post = snapshot.data[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 10,),
                                  GestureDetector(onTap: (){
                                    Navigator.of(context).pushNamed('Homenewspagemain');
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
                                                          Text("મોરબીમાં જુદા જુદા ચાર બનાવોમાં ચાર વ્યક્તિઓ સારવાર હેઠળ : બે ના અપમૃત્યુ"),
                                                          SizedBox(height: 10,),
                                                          Row(
                                                            children: [
                                                              Text("3rd sep"),
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

                  ],
                ),
              ),

              //tab4
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: GestureDetector(
                        onTap: (){

                          Navigator.of(context).pushNamed('Homenewspagemain');
                        },
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
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .6,
                      child: new ListView.builder(
                          itemCount: 4,
                          itemBuilder: (BuildContext ctxt, int index) {
                            //wp.Post post = snapshot.data[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 10,),
                                  GestureDetector(onTap: (){
                                    Navigator.of(context).pushNamed('Homenewspagemain');
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
                                                          Text("મોરબીમાં જુદા જુદા ચાર બનાવોમાં ચાર વ્યક્તિઓ સારવાર હેઠળ : બે ના અપમૃત્યુ"),
                                                          SizedBox(height: 10,),
                                                          Row(
                                                            children: [
                                                              Text("3rd sep"),
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


                  ],
                ),
              ),



              //tab5
              SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: GestureDetector(
                        onTap: (){

                          Navigator.of(context).pushNamed('Homenewspagemain');
                        },
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
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .6,
                      child: new ListView.builder(
                          itemCount: 4,
                          itemBuilder: (BuildContext ctxt, int index) {
                            //wp.Post post = snapshot.data[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 10,),
                                  GestureDetector(onTap: (){
                                    Navigator.of(context).pushNamed('Homenewspagemain');
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
                                                          Text("મોરબીમાં જુદા જુદા ચાર બનાવોમાં ચાર વ્યક્તિઓ સારવાર હેઠળ : બે ના અપમૃત્યુ"),
                                                          SizedBox(height: 10,),
                                                          Row(
                                                            children: [
                                                              Text("3rd sep"),
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


                  ],
                ),
              ),

            ],
          ),



        ),
      ),

    );
  }
}
