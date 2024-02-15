import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/CartController.dart';
import 'package:project/model/orderDetails.dart';
import 'package:project/pages/checkout.dart';
import 'package:project/pages/order_page.dart';
import 'package:project/pages/restaurantDetails.dart';
import 'package:project/pages/restaurant_page.dart';

class CartPage extends StatelessWidget {
  final String meal;
  final String description;
  CartPage({Key key, @required this.meal, @required this.description})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var cartController = Get.find<CartController>();
    var cart = cartController.cart;
    return Scaffold(
      backgroundColor: Color(0xFFCEDBD1),
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Center(
        child: Obx(
          () => ListView.builder(
            itemCount: cartController.orderDetails.length,
            itemBuilder: (BuildContext context, int index) {
              var keys = cart.keys.toList();
              var values = cart.values.toList();
              return CartDetails(
                meal: meal,
                description: description,
                controller: cartController,
                orderDetails: keys[index],
                quantity: values[index],
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}

class CartDetails extends StatelessWidget {
  final String meal;
  final String description;
  final CartController controller;
  final OrderDetails orderDetails;
  final int quantity;
  final int index;
  CartDetails(
      {Key key,
      @required this.meal,
      @required this.description,
      @required this.controller,
      @required this.orderDetails,
      @required this.quantity,
      @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$meal"),
              Text("$description"),
              Text("Quantity: $quantity"),
            ],
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              controller.removefromCart(orderDetails);
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OrderedItemsPage()));
                },
                child: Text(
                  "Checkout",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
