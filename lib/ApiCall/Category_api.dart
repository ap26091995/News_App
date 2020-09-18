import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wordpress/schemas/category.dart';
import 'package:http/http.dart' as http;

List<Category> Listofdata = new List();

Getnewsdata(){
//calling api

  http.get('https://morbimirror.com/wp-json/wp/v2/categories',
    ).then((res){

    print(res.body);

    var Storedataoflist = jsonDecode(res.body);
    print(Storedataoflist);
    Listofdata = (Storedataoflist as List).map((data)=>Category.fromJson(data)).toList();
    print(Listofdata.length);
    print(jsonEncode(Listofdata).toString());
  });

}