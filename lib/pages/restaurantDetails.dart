import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/CartController.dart';
import 'package:project/pages/order_page.dart';
import 'package:project/services/firestore.dart';
import 'package:project/model/storeDetails.dart';

import 'CartPage.dart';

class RestaurantDetails extends StatefulWidget {
  final String selectedRestaurant;
  RestaurantDetails({Key key, @required this.selectedRestaurant})
      : super(key: key);
  @override
  _RestaurantDetailsState createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  var cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: FutureBuilder<List<StoreDetails>>(
        future: FirestoreService().readStoreDetailData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<StoreDetails> filteredStoreDetails = snapshot.data
                .where((storeDetails) =>
                    storeDetails.storeName == widget.selectedRestaurant)
                .toList();
            return ListView.builder(
              itemCount: filteredStoreDetails.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(25),
                  child: ListTile(
                    // leading: Image.asset(
                    //   snapshot.data[index],
                    //   width: 40.0,
                    //   fit: BoxFit.fill,
                    // ),
                    title: Text(filteredStoreDetails[index].meal),
                    subtitle: Text(filteredStoreDetails[index].description),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderPage(
                            selectedstoreName:
                                filteredStoreDetails[index].storeName,
                            meal: filteredStoreDetails[index].meal,
                            description:
                                filteredStoreDetails[index].description,
                            price: filteredStoreDetails[index].price,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
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
