import 'package:project/pages/drawer_page.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/restaurant_page.dart';

List<String> images = [
  'images/western.jpg',
  'images/chinese.jpg',
  'images/japanese.jpg',
  'images/korean.jpg',
];

List<String> foodImage = [
  'images/texas_chicken_logo.png',
  'images/wokhey.jpg',
  'images/takagi_ramen.png',
  'images/sunyou.jpg',
];

List<String> cuisine = [
  'Western',
  'Chinese',
  'Japanese',
  'Korean',
];

List<String> foodName = [
  'Texas Chicken',
  'WokHey',
  'Takagi Ramen',
  'Sun You',
];

class HomePage extends StatelessWidget {
  final user;
  HomePage(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCEDBD1),
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      drawer: DrawerPage(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('images/background.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text("Recommended"),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RestaurantPage(
                              selectedCuisine: cuisine[index],
                            )));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 60,
                          child: CircleAvatar(
                            radius: 40.0,
                            backgroundImage: AssetImage(images[index]),
                          ),
                        ),
                      ),
                      Text(cuisine[index]),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Text("Popular restaurants"),
          Expanded(
            child: GridView.builder(
              itemCount: foodImage.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(foodImage[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Text(foodName[index]),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
