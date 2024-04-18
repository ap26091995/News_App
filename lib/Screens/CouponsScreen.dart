import 'dart:convert';

import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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
    await http
        .get(
      Uri.parse(
          "https://newsapp.innoventixsolutions.com/wp-json/wc/v3/coupons?consumer_key=ck_6b3814013df6c49e821870f49d053d387c35d369&consumer_secret=cs_b91a07887723bc82026a2f24ee5652204e886788"),
    )
        .then((res) {
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        isLoading = false;
        var couponData = jsonDecode(res.body);
        couponsModel = (couponData as List).map((data) => CouponsModel.fromJson(data)).toList();
        print("Coupons Length:${couponsModel!.length}");
      } else {
        isLoading = false;
        print("Coupons Length2:${couponsModel!.length}");
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getCoupons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          isLoading == true
              ? Expanded(
                  child: Center(
                      child: Text(
                  "Fetching Coupons",
                  style: TextStyle(fontSize: 18),
                )))
              : Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: couponsModel!.length,
                      itemBuilder: (BuildContext context, index) {
                        const Color primaryColor = Color(0xffcbf3f0);
                        const Color secondaryColor = Color(0xff368f8b);
                        DateTime? dateTime = DateTime.parse(couponsModel![index].dateExpires!);
                        String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                           child:CouponCard(
                             height: 160,curvePosition: 135,
                             backgroundColor: primaryColor,
                             curveAxis: Axis.vertical,
                             firstChild: Container(
                               decoration: const BoxDecoration(
                                 color: secondaryColor,
                               ),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Expanded(
                                     child: Center(
                                       child: Column(
                                         mainAxisSize: MainAxisSize.min,
                                         children: [
                                           Text(
                                             'Coupon Code',
                                             textAlign: TextAlign.center,
                                             style: TextStyle(
                                               fontSize: 13,
                                               fontWeight: FontWeight.bold,
                                               color: Colors.white,
                                             ),
                                           ),
                                           SizedBox(height: 4),
                                           Text(
                                             '${couponsModel![index].code!.toUpperCase()}',
                                             textAlign: TextAlign.center,
                                             style: TextStyle(
                                               fontSize: 24,
                                               color: Colors.white,
                                               fontWeight: FontWeight.bold,
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                   Divider(color: Colors.white54, height: 0),
                                   Expanded(
                                     child: Center(
                                       child: Text(
                                         'REDEEM',
                                         textAlign: TextAlign.center,
                                         style: TextStyle(
                                           color: Colors.white,
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                             secondChild: Container(
                               width: double.maxFinite,
                               padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                               child: Column(
                                 mainAxisSize: MainAxisSize.min,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     'Description',
                                     textAlign: TextAlign.center,
                                     style: TextStyle(
                                       fontSize: 14,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.black54,
                                     ),
                                   ),
                                   SizedBox(height: 4),
                                   Text(
                                     '${couponsModel![index].description}',

                                     style: TextStyle(
                                       fontSize: 16,
                                       color: secondaryColor,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                   Spacer(),
                                   Text(
                                     'Valid Till: $formattedDate',
                                     textAlign: TextAlign.center,
                                     style: TextStyle(
                                       color: Colors.black45,
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           )
                          // Container(
                          //     height: 105,
                          //     decoration: BoxDecoration(color: Colors.indigoAccent),
                          //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          //     child: Text(
                          //       "Coupon Code:\n${couponsModel![index].code!.toUpperCase()} - ${couponsModel![index].description}",
                          //       style: TextStyle(color: Colors.white, letterSpacing: 0.5, fontWeight: FontWeight.w500, fontSize: 18),
                          //     )),
                        );
                      }),
                )
        ],
      ),
    );
  }
}
