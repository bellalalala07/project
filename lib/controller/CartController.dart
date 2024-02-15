import 'package:get/get.dart';
import 'package:project/model/orderDetails.dart';

class CartController extends GetxController {
  var _cart = {}.obs; //reactive values of any changes

  //Getters
  get cart => _cart;

  int get cartCount => cart.length;
  int get count => _cart.length > 0 ? _cart.values.reduce((a, b) => a + b) : 0;

  //reduce method - add each value from the list
  void addToCart(OrderDetails orderDetails) {
    if (_cart.containsKey(orderDetails)) {
      _cart[orderDetails]++;
    } else {
      _cart[orderDetails] = 1;
    }
  }

  void removefromCart(OrderDetails orderDetails) {
    if (_cart.containsKey(orderDetails)) {
      if (_cart[orderDetails] > 1) {
        _cart[orderDetails]--;
      } else {
        _cart.remove(orderDetails);
      }
    }
  }

  void clear(index) {
    if (_cart.containsKey(index)) {
      _cart.remove(index);
    }
  }

  int getCount(index) {
    return _cart[index] ?? 0;
  }

  get orderDetails => _cart;
}
