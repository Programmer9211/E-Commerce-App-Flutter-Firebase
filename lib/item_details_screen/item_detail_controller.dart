import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/item_details_screen/item_detail_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ItemDetailController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = true, isAlreadyAvailable = false;
  late ItemDetailModel model;
  int discount = 0;

  Future<void> getItemDetails(String id) async {
    try {
      await _firestore.collection('products').doc(id).get().then((value) {
        model = ItemDetailModel.fromJson(value.data()!);
        discount = calculateDiscount(model.totalPrice, model.sellingPrice);
        checkIfAlreadyInCart();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> checkIfAlreadyInCart() async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('cart')
          .where('id', isEqualTo: model.id)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          isAlreadyAvailable = true;
        }
        isLoading = false;
        update();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> addItemsToCart() async {
    isLoading = true;
    update();

    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('cart')
          .doc(model.id)
          .set({'id': model.id}).then((value) {
        checkIfAlreadyInCart();
      });
    } catch (e) {
      print(e);
    }
  }

  int calculateDiscount(int totalPrice, int sellingPrice) {
    double discount = ((totalPrice - sellingPrice) / totalPrice) * 100;

    return discount.toInt();
  }
}
