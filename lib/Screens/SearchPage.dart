import 'package:flutter/material.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';

class searching extends StatefulWidget {
  @override
  _searchingState createState() => _searchingState();
}

class _searchingState extends State<searching> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          children: <Widget>[
            Container(
              height: 70,
              decoration: BoxDecoration(
                  color: staticBlue),
            ),
            Stack(
              children: <Widget>[
                Container(width: 300,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(9, 50, 0, 0),
                    child: Card(shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Expanded(
                          child: Container(
                            height: 30,
                            child: Center(
                              child: TextField(
                                textAlign: TextAlign.start,

                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Search News',
                                  hintStyle: TextStyle(fontSize: 13,),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,

                                    ),
                                  ),

                                  contentPadding: EdgeInsets.all(16),

                                ),
                              ),
                            ),
                          ),
                        )

                      ),
                    ),

                  ),
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 9, 0),
                      child: Container(
                          decoration: BoxDecoration(color: staticWhite,
                              border: Border.all(color: staticBlue),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pop();
                                }
                                ,child: Icon(Icons.cancel)),
                          )),
                    ),
                  ],
                ),

              ],
            ),
          ],
        ),
      ],),
    );
  }
}
