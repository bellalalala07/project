import 'package:flutter/material.dart';

class OrderedItemsPage extends StatefulWidget {
  @override
  State<OrderedItemsPage> createState() => _OrderedItemsPageState();
}

class _OrderedItemsPageState extends State<OrderedItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCEDBD1),
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text("Self-pick up"),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1.0,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Order will be ready in:"),
                          SizedBox(height: 10),
                          Text("15 min"),
                          SizedBox(height: 20),
                          Text("Order No:"),
                          SizedBox(height: 10),
                          Text("1314"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.black,
                  thickness: 1.0,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      child: const Text('Return to cart'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
