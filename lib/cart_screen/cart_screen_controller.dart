import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/item_details_screen/item_detail_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartScreenController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List productIds = [];
  List<ItemDetailModel> productsDetails = [];
  bool isLoading = true;
  int totalPrice = 0, totalDiscount = 0, totalSellingPrice = 0;

  Future<void> getCartItems() async {
    productsDetails = [];
    productIds = [];

    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('cart')
          .get()
          .then((value) {
        productIds = value.docs.map((e) => e.data()['id']).toList();
        getProductsDetails();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> getProductsDetails() async {
    for (var item in productIds) {
      try {
        await _firestore.collection('products').doc(item).get().then((value) {
          productsDetails.add(ItemDetailModel.fromJson(value.data()!));
        });
      } catch (e) {
        print(e);
      }
    }

    calculatePrice();

    isLoading = false;
    update();
  }

  Future<void> removeFromCart(String id) async {
    isLoading = true;
    update();

    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('cart')
          .doc(id)
          .delete()
          .then((value) {
        getCartItems();
      });
    } catch (e) {}
  }

  int calculateDiscount(int totalPrice, int sellingPrice) {
    double discount = ((totalPrice - sellingPrice) / totalPrice) * 100;

    return discount.toInt();
  }

  void calculatePrice() {
    for (var item in productsDetails) {
      totalPrice = totalPrice + item.totalPrice;
      totalSellingPrice = totalSellingPrice + item.sellingPrice;
    }

    totalDiscount = totalPrice - totalSellingPrice;
  }

  @override
  void onInit() {
    super.onInit();
    getCartItems();
  }
}
