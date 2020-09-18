import 'package:flutter/material.dart';

import 'ApiCall/Category_api.dart';
import 'ApiCall/Post_api.dart';

class testing extends StatefulWidget {
  @override
  _testingState createState() => _testingState();
}

class _testingState extends State<testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: RaisedButton(child: Text("ok"),
          onPressed: (){
            Getpost();
          }
          ,
        ),
      )
    );
  }
}
