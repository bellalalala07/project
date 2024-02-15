class StoreDetails {
  String uid;
  String meal;
  String description;
  String price;
  // String image;
  String storeName;

  StoreDetails(
      {this.uid,
      this.meal,
      this.description,
      this.price,
      //this.image,
      this.storeName});

  StoreDetails.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    meal = data['meal'];
    description = data['description'];
    price = data['price'];
    //image = data['image'];
    storeName = data['storeName'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'meal': meal,
      'description': description,
      'price': price,
      //'image': image,
      'storeName': storeName,
    };
  }
}
