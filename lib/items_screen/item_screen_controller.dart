import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/items_screen/items_model.dart';
import 'package:get/get.dart';

class ItemScreenController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String categoryId = "";
  String categoryTitle = "";
  List<ItemsModel> itemsData = [];
  List<ItemsModel> searchResults = [];
  bool isLoading = true, isSearchLoading = false;

  Future<void> getSubCategoryData() async {
    try {
      await _firestore
          .collection('categories')
          .doc(categoryId)
          .collection(categoryTitle)
          .get()
          .then((value) {
        itemsData =
            value.docs.map((e) => ItemsModel.fromJson(e.data())).toList();

        isLoading = false;

        update();
      });
    } catch (e) {
      print(e);
    }
  }

  int calculateDiscount(int totalPrice, int sellingPrice) {
    double discount = ((totalPrice - sellingPrice) / totalPrice) * 100;

    return discount.toInt();
  }

  Future<void> searchProducts(String query) async {
    if (query.isNotEmpty) {
      isSearchLoading = true;
      Future.delayed(Duration.zero, () {
        update();
      });

      try {
        await _firestore
            .collection('categories')
            .doc(categoryId)
            .collection(categoryTitle)
            .where('title', isGreaterThanOrEqualTo: query)
            .get()
            .then((value) {
          searchResults =
              value.docs.map((e) => ItemsModel.fromJson(e.data())).toList();

          isSearchLoading = false;

          update();
        });
      } catch (e) {
        print(e);
      }
    }
  }
}
