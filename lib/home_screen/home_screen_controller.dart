import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/home_screen/model_class/banner_data_model.dart';
import 'package:e_commerce/home_screen/model_class/categories_model.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late List<BannerDataModel> bannerData;
  late List<CategoriesModel> categoriesData;
  late List<CategoriesModel> featuredData;
  bool isLoading = true;
  List<RxBool> isSelected = [];

  void getAllData() async {
    await Future.wait([
      getBannerData(),
      getAllCategories(),
      getFeaturedData(),
    ]).then((value) {
      print("Data");
      print(bannerData[0].image);
      print(categoriesData[0].id);
      print(featuredData[1].id);
      isLoading = false;
      update();
    });
  }

  void changeIndicator(int index) {
    for (var i = 0; i < isSelected.length; i++) {
      if (isSelected[i].value) {
        isSelected[i].value = false;
      }
    }

    isSelected[index].value = true;
  }

  Future<void> getBannerData() async {
    await _firestore.collection('banner').get().then((value) {
      bannerData =
          value.docs.map((e) => BannerDataModel.fromJson(e.data())).toList();

      for (var i = 0; i < bannerData.length; i++) {
        isSelected.add(false.obs);
      }

      isSelected[0].value = true;
    });
  }

  Future<void> getAllCategories() async {
    await _firestore.collection('categories').get().then((value) {
      categoriesData =
          value.docs.map((e) => CategoriesModel.fromJson(e.data())).toList();
    });
  }

  Future<void> getFeaturedData() async {
    await _firestore.collection('featured').get().then((value) {
      featuredData =
          value.docs.map((e) => CategoriesModel.fromJson(e.data())).toList();
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllData();
  }
}
