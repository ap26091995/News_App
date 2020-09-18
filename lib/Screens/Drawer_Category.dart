import 'package:flutter/material.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';



class News_category_drawer extends StatefulWidget {
  @override
  _News_category_drawerState createState() => _News_category_drawerState();
}

class _News_category_drawerState extends State<News_category_drawer> {
  final title = 'Grid List';

  List<String> clist=[

   "   Avsanondh & Besnu",
   " Birthday",
  "  Halvad",
"    Maliya Miyana",
    "Morbi",
    "Promotional",
    "Tankara",
    "Wakaner",

    "Ahmedabad",
    "Amreli",
    "Anand",
    "Aravalli",
    "Bharuch",
    "Bhavnagar",
    "Botad",
   " Chhota Udaipur",
    "Dahod",
    "Dang"

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: staticBlue,
        automaticallyImplyLeading: true,
        title: Text("Choose Category"),
      ),
      body: GridView.count(

        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(clist.length,(index) {
          return Card(elevation: 7.7,color: staticDarkblue,
            child: InkWell(splashColor: staticBlack,onTap: (){



            },
              child: GridTile(
                child: Center(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text(
                          clist[index],textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20,color: staticWhite,fontWeight: FontWeight.w400)
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),

    );
  }
}
