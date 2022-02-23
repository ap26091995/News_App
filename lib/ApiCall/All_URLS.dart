import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Category.dart';

const String BaseURL = "https://thepressofindia.com/";
//const String BaseURL = "https://morbimirror.com/";
const String urlForTopBarCategories = BaseURL+"wp-json/wp/v2/categories?per_page=100&hide_empty=true";
const String urlForMenu = BaseURL+"wp-json/wp/v2/menu";
const String urlForTopBarSubCategories = BaseURL+"wp-json/wp/v2/categories?per_page=100&order=desc&hide_empty=true&parent=";

const String privacyPolicy = "${BaseURL}wp-json/wp/v2/pages/3";
const String aboutUs = "${BaseURL}wp-json/wp/v2/pages/2149";
const String faq = "${BaseURL}wp-json/wp/v2/pages/2151";


class DatabaseHelper{

  static getAllData() async {

      await http.get(Uri.parse(urlForTopBarCategories),
      ).then((res){
        //print(res.body);
        var Storedataoflist = jsonDecode(res.body);
        // print(Storedataoflist);
        Global.CategoryList = (Storedataoflist as List).map((data)=>CategoryForMenu.fromJson(data)).toList();
        print(Global.CategoryList.length);
        // print(jsonEncode(Listofdata).toString());
      });

  }

}
