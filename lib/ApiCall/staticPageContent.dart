import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:morbimirror/ApiCall/All_URLS.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Page.dart';

getPrivacyPage() {
  http
      .get(
    Uri.parse('$privacyPolicy'),
  )
      .then((res) {
    print(res.body);
    var Storedataoflist = jsonDecode(res.body);
    print(Storedataoflist);
    Global.privacyPolicPage = PageData.fromJson(Storedataoflist);
  });
}

getAboutUs() {
  http
      .get(
    Uri.parse('$aboutUs'),
  )
      .then((res) {
    print("ABOUT US");
    print(res.body);
    print("ABOUT US");
    final StoreDataOfList = jsonDecode(res.body);
    print(StoreDataOfList);
    Global.aboutUsPage = PageData.fromJson(StoreDataOfList);
    print("ABOUT US 2");
    print(Global.aboutUsPage);
    print("ABOUT US 3");
  });
}

getFaq() {
  http
      .get(
    Uri.parse('$faq'),
  )
      .then((res) {
    print(res.body);
    var Storedataoflist = jsonDecode(res.body);
    print(Storedataoflist);
    Global.faqPage = PageData.fromJson(Storedataoflist);
  });
}
