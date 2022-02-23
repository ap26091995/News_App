import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Category.dart';
import 'package:morbimirror/Models/main_cat_model.dart';


const String BaseURL = "https://morbimirror.com/";
const String mainContnetURL = BaseURL+"wp-json/wp/v2/subcat_posts/";
const String urlForTopBarCategories = BaseURL+"wp-json/wp/v2/categories?per_page=100&hide_empty=true";
const String urlForMenu = BaseURL+"wp-json/wp/v2/menu";
const String urlForTopBarSubCategories = BaseURL+"wp-json/wp/v2/categories?per_page=100&order=desc&hide_empty=true&parent=";

const String privacyPolicy = "${BaseURL}wp-json/wp/v2/pages/3";
const String aboutUs = "${BaseURL}wp-json/wp/v2/pages/2149";
const String faq = "${BaseURL}wp-json/wp/v2/pages/2151";


class DatabaseHelper{

  static getAllData() async {

      await http.get(Uri.parse(mainContnetURL),
      ).then((res){
        print(res.body);
        var Storedataoflist = jsonDecode(res.body);
        // print(Storedataoflist);
        Global.mainDataList = (Storedataoflist as List).map((data)=>MainCatModel.fromJson(data)).toList();

        print("Actual Data : "+Global.mainDataList.length.toString());

        for(int i=0;i<Global.mainDataList.length;i++){
          Global.myTabs.add(
              Tab(
                child: Text(Global.mainDataList[i].parentCatName,style: TextStyle(
                    color: Colors.red
                ),),
              )
          );

         // Global.allData.add(null);

          // Global.categoryPosts.add(await getPosts(url: "https://morbimirror.com/wp-json/wp/v2/posts?status=publish&per_page=20&page=1&categories=${Global.menu[i].objectId}"));
        }
        // print(jsonEncode(Listofdata).toString());
      });

  }

}
