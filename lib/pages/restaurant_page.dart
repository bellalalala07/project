import 'package:flutter/material.dart';
import 'package:project/pages/order_page.dart';
import 'package:project/pages/restaurantDetails.dart';
import 'package:project/services/firestore.dart';
import 'package:project/model/store.dart';

class RestaurantPage extends StatefulWidget {
  final String selectedCuisine;
  RestaurantPage({Key key, @required this.selectedCuisine}) : super(key: key);

  @override
  __RestaurantPageState createState() => __RestaurantPageState();
}

class __RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.selectedCuisine} Cuisine'),
      ),
      body: FutureBuilder<List<Store>>(
        future: FirestoreService().readStoreData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Store> filteredStores = snapshot.data
                .where((store) => store.cuisine == widget.selectedCuisine)
                .toList();
            return ListView.builder(
              itemCount: filteredStores.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RestaurantDetails(
                                    selectedRestaurant:
                                        filteredStores[index].name,
                                  )));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Image.asset(
                            filteredStores[index].image,
                            width: 50,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            filteredStores[index].name,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                          Text(
                            filteredStores[index].description,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            filteredStores[index].rating,
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.0),
                          ),
                        ],
                      ),
                    ],
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
