import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:morbimirror/ApiCall/All_URLS.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Page.dart';


getPrivacyPage(){
  http.get('$privacyPolicy',
  ).then((res){
    print(res.body);
    var Storedataoflist = jsonDecode(res.body);
    print(Storedataoflist);
    Global.privacyPolicPage =PageData.fromJson(Storedataoflist);
  });
}

getAboutUs(){
  http.get('$aboutUs',
  ).then((res){
    print(res.body);
    var Storedataoflist = jsonDecode(res.body);
    print(Storedataoflist);
    Global.aboutUsPage =PageData.fromJson(Storedataoflist);
  });
}


getFaq(){
  http.get('$faq',
  ).then((res){
    print(res.body);
    var Storedataoflist = jsonDecode(res.body);
    print(Storedataoflist);
    Global.faqPage =PageData.fromJson(Storedataoflist);
  });
}