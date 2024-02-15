import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/CartController.dart';
import 'package:project/pages/CartPage.dart';
import 'package:project/services/firestore.dart';
import 'package:project/model/orderDetails.dart';

class OrderPage extends StatefulWidget {
  final String selectedstoreName;
  final String meal;
  final String description;
  final String price;
  final String image;

  OrderPage(
      {Key key,
      @required this.selectedstoreName,
      @required this.meal,
      @required this.description,
      @required this.price,
      @required this.image})
      : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  var cartController = Get.put(CartController());
  String mealType;
  String side;
  String drink;
  bool selectOptionOne = false;
  bool selectOptionTwo = false;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCEDBD1),
      appBar: AppBar(
        title: const Text('Order'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 150.0,
              width: 30.0,
              child: InkWell(
                splashColor: Colors.redAccent,
                highlightColor: Colors.blueAccent.withOpacity(0.5),
                onTap: () {
                  if (cartController.count > 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(
                          meal: widget.meal,
                          description: widget.description,
                        ),
                      ),
                    );
                  }
                },
                child: Stack(
                  children: <Widget>[
                    Badge(
                      position: BadgePosition.topEnd(top: -3, end: -8),
                      badgeColor: Colors.yellow[700],
                      badgeContent: Obx(
                        () => Text(
                          cartController.count.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          cartController.count > 0
                              ? Icons.shopping_cart
                              : Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<OrderDetails>>(
        future: FirestoreService().readOrderDetailData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<OrderDetails> filteredOrderDetails = snapshot.data
                .where((orderDetails) =>
                    orderDetails.restaurantName == widget.selectedstoreName)
                .toList();
            return ListView(
              children: [
                // Display your fetched data here
                for (var orderDetail in filteredOrderDetails)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Image.asset(
                              '${widget.image}',
                              width: 50,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${widget.meal}",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "${widget.description}",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Divider(
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(orderDetail.mainDishTitle),
                            RadioListTile(
                              title: Text(orderDetail.dishOptionOne),
                              value: orderDetail.dishOptionOne,
                              groupValue: mealType,
                              onChanged: (value) {
                                setState(() {
                                  mealType = value.toString();
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text(orderDetail.dishOptionTwo),
                              value: orderDetail.dishOptionTwo,
                              groupValue: mealType,
                              onChanged: (value) {
                                setState(() {
                                  mealType = value.toString();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(orderDetail.sideTitle),
                            RadioListTile(
                              title: Text(orderDetail.sideOptionOne),
                              value: orderDetail.sideOptionOne,
                              groupValue: side,
                              onChanged: (value) {
                                setState(() {
                                  side = value.toString();
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text(orderDetail.sideOptionTwo),
                              value: orderDetail.sideOptionTwo,
                              groupValue: side,
                              onChanged: (value) {
                                setState(() {
                                  side = value.toString();
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text(orderDetail.sideOptionThree),
                              value: orderDetail.sideOptionThree,
                              groupValue: side,
                              onChanged: (value) {
                                setState(() {
                                  side = value.toString();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(orderDetail.drinkTitle),
                            RadioListTile(
                              title: Text(orderDetail.drinkOptionOne),
                              value: orderDetail.drinkOptionOne,
                              groupValue: drink,
                              onChanged: (value) {
                                setState(() {
                                  drink = value.toString();
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text(orderDetail.drinkOptionTwo),
                              value: orderDetail.drinkOptionTwo,
                              groupValue: drink,
                              onChanged: (value) {
                                setState(() {
                                  drink = value.toString();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(orderDetail.addTitle),
                            CheckboxListTile(
                              title: Text(orderDetail.addOptionOne),
                              value: selectOptionOne,
                              onChanged: (value) {
                                setState(() {
                                  selectOptionOne = value;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: Text(orderDetail.addOptionTwo),
                              value: selectOptionTwo,
                              onChanged: (value) {
                                setState(() {
                                  selectOptionTwo = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                counter--;
                              });
                            },
                          ),
                          Text('$counter'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                counter++;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Divider(
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            child: const Text('Add to cart'),
                            onPressed: () {
                              cartController.addToCart(orderDetail);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartPage(
                                    meal: widget.meal,
                                    description: widget.description,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container(
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
