import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wordpress/schemas/category.dart';
import 'package:http/http.dart' as http;
import 'package:morbimirror/Models/Posts.dart';

List<Posts> Listofpost = new List();

Getpost(){
//calling api

  http.get('https://morbimirror.com/wp-json/wp/v2/posts?categories=50',).then((res){

    print(res.body);

    var Storedataofpost = jsonDecode(res.body);
    print(Storedataofpost);
    Listofpost = (Storedataofpost as List).map((data)=>Posts.fromJson(data)).toList();
    print(Listofpost.length);
    print(jsonEncode(Listofpost).toString());
  });
}