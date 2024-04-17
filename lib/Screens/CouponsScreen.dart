import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../CustomFile/CustomColorsFile.dart';
import '../Models/coupons_model.dart';
class CouponsScreen extends StatefulWidget {
  const CouponsScreen({super.key});

  @override
  State<CouponsScreen> createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {

  List<CouponsModel>? couponsModel = [];
  bool? isLoading = false;
  getCoupons() async {
    isLoading = true;
    print("Coupons");
    await http.get(Uri.parse("https://newsapp.innoventixsolutions.com/wp-json/wc/v3/coupons?consumer_key=ck_6b3814013df6c49e821870f49d053d387c35d369&consumer_secret=cs_b91a07887723bc82026a2f24ee5652204e886788"),
    ).then((res){
      print(res.statusCode);
      print(res.body);
      if(res.statusCode == 200){
        isLoading = false;

        var couponData = jsonDecode(res.body);
        // print(Storedataoflist);
        couponsModel = (couponData as List).map((data)=>CouponsModel.fromJson(data)).toList();
        print("Coupons Length:${couponsModel!.length}");
        // print(jsonEncode(Listofdata).toString());
      }
      else{
        isLoading = false;
        print("Coupons Lengthww:${couponsModel!.length}");
      }

    });
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getCoupons();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Coupons",
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
          isLoading==true?Text("Loading"):Expanded(
            child: ListView.builder(
              shrinkWrap: true,
                itemCount: couponsModel!.length,
                itemBuilder:(BuildContext context, index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Container(
                  height: 105,
                  decoration: BoxDecoration(
                    color: Colors.indigoAccent
                  ),
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                    child: Text("Coupon Code:\n${couponsModel![index].code!.toUpperCase()} - ${couponsModel![index].description}",style: TextStyle(color: Colors.white,letterSpacing:0.5,fontWeight: FontWeight.w500,fontSize: 18),)),
              );
            }),
          )
        ],
      ),
    );
  }
}
