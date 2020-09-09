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
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[staticBlue, staticWhite])),
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
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.search, color: staticBlack),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Search “ News”",
                              style: TextStyle(color: staticBlack),
                            ),
                          ],
                        ),

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
