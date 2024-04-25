import 'dart:convert';

import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:morbimirror/Models/listing_model.dart';

import '../CustomFile/CustomColorsFile.dart';
import '../Models/coupons_model.dart';

class ListingsScreen extends StatefulWidget {
  const ListingsScreen({super.key});

  @override
  State<ListingsScreen> createState() => _ListingsScreenState();
}

class _ListingsScreenState extends State<ListingsScreen> {
  List<ListingModel>? listingModel = [];
  bool? isLoading = false;
  getListings({String? consumerKey, String? consumerSecret, String? searchProduct}) async {
    isLoading = true;
    print("Listing");
    await http
        .get(
      Uri.parse(
          "https://newsapp.innoventixsolutions.com/wp-json/wc/v3/products?consumer_key=$consumerKey&consumer_secret=$consumerSecret&search=$searchProduct"),
    )
        .then((res) {
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        isLoading = false;
        var listingData = jsonDecode(res.body);
        listingModel = (listingData as List).map((data) => ListingModel.fromJson(data)).toList();
        print("Listing Length:${listingModel!.length}");
      } else {
        isLoading = false;
        print("Listing Length2:${listingModel!.length}");
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getListings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Listings",
          style: TextStyle(
            color: staticDarkblue,
            fontSize: MediaQuery.of(context).size.width * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          isLoading == true
              ? Expanded(
              child: Center(
                  child: Text(
                    "Fetching Listing",
                    style: TextStyle(fontSize: 18),
                  )))
              : Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: listingModel!.length,
                itemBuilder: (BuildContext context, index) {
                  const Color primaryColor = Color(0xffcbf3f0);
                  const Color secondaryColor = Color(0xff368f8b);

                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child:
                    Container(
                        height: 105,
                        decoration: BoxDecoration(color: Colors.indigoAccent),
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Text(
                          "${listingModel![index].title!.rendered}",
                          style: TextStyle(color: Colors.white, letterSpacing: 0.5, fontWeight: FontWeight.w500, fontSize: 18),
                        )),
                  );
                }),
          )
        ],
      ),
    );
  }
}
