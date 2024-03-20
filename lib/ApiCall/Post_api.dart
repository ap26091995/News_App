import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:morbimirror/Models/Posts.dart';



Future<List<Posts>?> getPosts({String? url }) async {
//calling api
  List<Posts>? Listofpost =  [];
    await  http.get(Uri.parse(url!),headers:{'Authorization': "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsIm5hbWUiOiJuZXdzYXBwIiwiaWF0IjoxNzEwOTI3Mzk0LCJleHAiOjE4Njg2MDczOTR9.MX47pZmyuwPVDCKyrPWcM0-sU3xZATVFXmNnkOaiECY"}).then((res){
    print(res.body);
    var Storedataofpost = jsonDecode(res.body);
    print(Storedataofpost);
    Listofpost = (Storedataofpost["posts"] as List).map((data)=>Posts.fromJson(data)).toList();
    print(Listofpost!.length);
    print(jsonEncode(Listofpost).toString());
  });

return Listofpost;

}