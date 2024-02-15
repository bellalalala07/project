import 'package:flutter/material.dart';
import 'package:project/pages/home_page.dart';

import 'model/user.dart';

class Selection extends StatefulWidget {
  final User user;
  Selection({Key key, this.user}) : super(key: key);
  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  List<String> images = [
    'images/western.jpg',
    'images/chinese.jpg',
    'images/japanese.jpg',
    'images/korean.jpg',
  ];

  List<String> name = [
    'Western',
    'Chinese',
    'Japanese',
    'Korean',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFCEDBD1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Discover Cuisine',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: CircleAvatar(
                          radius: 55.0,
                          backgroundImage: AssetImage(images[index]),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        name[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
                itemCount: images.length,
              ),
            ),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomePage(widget.user)));
              },
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
