import 'package:cloud_firestore/cloud_firestore.dart';
import 'Orders.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference prodCollection =
      Firestore.instance.collection('productOrders');

  Future updateUserData(String prodName, int quantity, int price,
      String address, String customerName) async {
    return await prodCollection.document(uid).setData({
      'customerName': customerName,
      'prodName': prodName,
      'quantity': quantity,
      'price': price,
      'address': address,
    });
  }

  //brew list from snapshot
  List<Orders> _OrdersListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Orders(
        uid: uid,
        prodName: doc.data['prodName'] ?? '',
        quantity: doc.data['quantity'] ?? 0,
        price: doc.data['price'] ?? 0,
        address: doc.data['address'] ?? '',
        customerName: doc.data['customerName'] ?? '',
      );
    }).toList();
  }

  Stream<List<Orders>> get orderDetails {
    return prodCollection.snapshots().map(_OrdersListFromSnapshot);
  }
}
