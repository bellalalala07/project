import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/orderDetails.dart';
import 'package:project/model/store.dart';
import 'package:project/model/storeDetails.dart';

class FirestoreService {
  //create new stores
  final CollectionReference storeCollection =
      FirebaseFirestore.instance.collection('stores');

  final CollectionReference storeDetailCollection =
      FirebaseFirestore.instance.collection('storeDetails');

  final CollectionReference orderDetailsCollection =
      FirebaseFirestore.instance.collection('orderDetails');

  Future<List<Store>> readStoreData() async {
    List<Store> storeList = [];
    QuerySnapshot snapshot = await storeCollection.get();
    snapshot.docs.forEach((document) {
      Store store = Store.fromMap(document.data());
      storeList.add(store);
    });
    print('StoreList: $storeList');
    return storeList;
  }

  Future<List<StoreDetails>> readStoreDetailData() async {
    List<StoreDetails> storeDetailList = [];
    QuerySnapshot snapshot = await storeDetailCollection.get();
    snapshot.docs.forEach((document) {
      StoreDetails storeDetails = StoreDetails.fromMap(document.data());
      storeDetailList.add(storeDetails);
    });
    print('StoreDetailList: $storeDetailList');
    return storeDetailList;
  }

  Future<List<OrderDetails>> readOrderDetailData() async {
    List<OrderDetails> orderDetailList = [];
    QuerySnapshot snapshot = await orderDetailsCollection.get();
    snapshot.docs.forEach((document) {
      OrderDetails orderDetails = OrderDetails.fromMap(document.data());
      orderDetailList.add(orderDetails);
    });
    print('OrderDetailList: $orderDetailList');
    return orderDetailList;
  }
}
