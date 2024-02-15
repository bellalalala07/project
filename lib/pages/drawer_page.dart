import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project/model/user.dart';
import 'package:project/pages/about_page.dart';
import 'package:project/pages/account_page.dart';
import 'package:project/pages/chatbot_page.dart';
import 'package:project/pages/home_page.dart';
import 'package:project/services/firebaseauth_service.dart';

class DrawerPage extends StatefulWidget {
  final User user;
  final File profileImage;
  DrawerPage({Key key, this.user, this.profileImage}) : super(key: key);
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //Use SizedBox to contain Drawer
      width: MediaQuery.of(context).size.width * 0.8, //Set Drawer width
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: AssetImage('images/header_bg.jpg'),
              //   ),
              // ),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage: widget.profileImage != null
                            ? FileImage(widget.profileImage)
                            : AssetImage('images/profile.jpg'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomePage(widget.user)));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Account'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AccountPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('About'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AboutPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.chat_bubble),
              title: Text('Chatbot'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ChatbotPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                FirebaseAuthService().signOut();
                Navigator.of(context).pushNamed('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
