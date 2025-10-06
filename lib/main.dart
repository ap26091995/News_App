import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:morbimirror/ApiCall/All_URLS.dart';
import 'package:morbimirror/Screens/Listing_Screen.dart';
//import 'package:morbiupdate /Screens/BookMarkPage.dart';
import 'package:morbimirror/Screens/SearchPage.dart';
import 'package:morbimirror/Screens/Splash_Screen.dart';
import 'package:morbimirror/Screens/StaticPageDisplay.dart';

import 'Screens/BookMarkPage.dart';
import 'Screens/Category_News.dart';
import 'Screens/CouponsScreen.dart';
import 'Screens/Drawer_Category.dart';
import 'Screens/HomeNewsMainPage.dart';
import 'Screens/Homepage_New.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(() => print("all ok"));
  await DatabaseHelper.getAllData();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: splashscreen(),
      routes: {
        'home': (context) => homepage(),
        'categorynews': (context) => CategoryNews(),
        'Homenewspagemain': (context) => Newsmainpage(),
        'search': (context) => searching(),
        'drawer_category': (context) => News_category_drawer(),
        //'test':(context)=>testing(),
        'staticPage': (context) => StaticPageDisplay(),
        'bookmark': (context) => BookmarkPage(),
        'coupons': (context) => CouponsScreen(),
        'listing': (context) => ListingsScreen(),
        'openListing': (context) => OpenListing(),
      },
    );
  }
}
