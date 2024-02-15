import 'package:flutter/material.dart';
import 'package:project/pages/drawer_page.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCEDBD1),
      appBar: AppBar(
        title: Text("About Us"),
      ),
      drawer: DrawerPage(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Application",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "We provide services for customers to be able to order their food right to their doorsteps. They can choose a variety of different categories and choose their favourite food to their liking. Upon completing the order, customers can input special requests and edit or delete the items they ordered. A rating form would appear after all is transitions is complete.",
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Company Information"),
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Company has established since 2020, we have won various awards anddonated to various charity through events such as our 2018 cross country run. Wevalue the integrity and honesty at our company and we welcome you to join us today!",
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Developer Info"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "I'm Bella Lu Yi Tian, developer of this application.",
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Contact me"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  child: Text("86795243"),
                  onTap: () => launch("tel://+65 8679 5243"),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Email"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  child: Text("bella.lu.sg@hotmail.com"),
                  onTap: () => launch(
                      "mailto:bella.lu.sg@hotmail.com?subject=Feedback&body=New%20plugin"),
                ),
              ],
            ),
          ],
        ),
      ),
    ); // Container
  }
}
