import 'package:YukCamping/keranjang/cart_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final _items = <CartItem, int>{}.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void tambahItem(CartItem item) {
    if (_items.containsKey(item)) {
      _items[item] = _items[item]! + 1;
    } else {
      _items[item] = 1;
    }

    Get.snackbar(
      "Product Add",
      "Your Paket Added the ${item.name} to price Rp.${item.price}",
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
    );
  }

  void tambahItemCart(CartItem item) {
    if (_items.containsKey(item)) {
      _items[item] = _items[item]! + 1;
    } else {
      _items[item] = 1;
    }
  }

  void kurangItem(CartItem item) {
    if (_items.containsKey(item) && _items[item] == 1) {
      _items.removeWhere((key, value) => key == item);
    } else {
      _items[item] = _items[item]! - 1;
    }
  }

  get item => _items;

  get itemSubtotal =>
      _items.entries.map((item) => item.key.price * item.value).toList();

  get total {
    if (_items.entries.isEmpty) {
      return '0';
    }

    final total = _items.entries
        .map((item) => item.key.price * item.value)
        .toList()
        .reduce((value, element) => value + element);

    return total;
  }

  Stream<QuerySnapshot<Object?>> getCartItems() {
    CollectionReference destinasi = firestore.collection('destination');

    return destinasi.snapshots();
  }
}

// class Db {
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

//   Stream<List<CartItem>> getCartItems() {
//     CollectionReference cartCollection =
//         FirebaseFirestore.instance.collection('destination');

//     return cartCollection.snapshots().map((querySnapshot) =>
//         querySnapshot.docs.map((doc) => CartItem.fromSnapshot(doc)).toList());
//   }
// }
