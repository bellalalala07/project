class OrderDetails {
  String uid;
  String restaurantName;
  String mainDishTitle;
  String dishOptionOne;
  String dishOptionTwo;
  String sideTitle;
  String sideOptionOne;
  String sideOptionTwo;
  String sideOptionThree;
  String drinkTitle;
  String drinkOptionOne;
  String drinkOptionTwo;
  String addTitle;
  String addOptionOne;
  String addOptionTwo;

  OrderDetails(
      {this.uid,
      this.restaurantName,
      this.mainDishTitle,
      this.dishOptionOne,
      this.dishOptionTwo,
      this.sideTitle,
      this.sideOptionOne,
      this.sideOptionTwo,
      this.sideOptionThree,
      this.drinkTitle,
      this.drinkOptionOne,
      this.drinkOptionTwo,
      this.addTitle,
      this.addOptionOne,
      this.addOptionTwo});

  OrderDetails.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    restaurantName = data['restaurantName'];
    mainDishTitle = data['mainDishTitle'];
    dishOptionOne = data['dishOptionOne'];
    dishOptionTwo = data['dishOptionTwo'];
    sideTitle = data['sideTitle'];
    sideOptionOne = data['sideOptionOne'];
    sideOptionTwo = data['sideOptionTwo'];
    sideOptionThree = data['sideOptionThree'];
    drinkTitle = data['drinkTitle'];
    drinkOptionOne = data['drinkOptionOne'];
    drinkOptionTwo = data['drinkOptionTwo'];
    addTitle = data['addTitle'];
    addOptionOne = data['addOptionOne'];
    addOptionTwo = data['addOptionTwo'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'restaurantName': restaurantName,
      'mainDishTitle': mainDishTitle,
      'dishOptionOne': dishOptionOne,
      'dishOptionTwo': dishOptionTwo,
      'sideTitle': sideTitle,
      'sideOptionOne': sideOptionOne,
      'sideOptionTwo': sideOptionTwo,
      'sideOptionThree': sideOptionThree,
      'drinkTitle': drinkTitle,
      'drinkOptionOne': drinkOptionOne,
      'drinkOptionTwo': drinkOptionTwo,
      'addTitle': addTitle,
      'addOptionOne': addOptionOne,
      'addOptionTwo': addOptionTwo,
    };
  }
}
