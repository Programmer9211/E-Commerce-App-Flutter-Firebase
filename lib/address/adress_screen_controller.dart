import 'package:e_commerce/const/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdressScreenController extends GetxController {
  late SharedPreferences _preferences;
  String name = "", address = "", pincode = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  bool isAddressAvailable = false;

  Future<void> getInstance() async {
    _preferences = await SharedPreferences.getInstance();

    String address = getString('address');

    if (address.isNotEmpty) {
      isAddressAvailable = true;
    } else {
      isAddressAvailable = false;
    }

    initilizeInfo();

    update();
  }

  void onTap() async {
    if (nameController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        pincodeController.text.isNotEmpty) {
      await saveString('name', nameController.text);
      await saveString('address', addressController.text);
      await saveString('pincode', pincodeController.text);

      getInstance();
    } else {
      showAlert("All fields are required");
    }
  }

  void onEdit() async {
    isAddressAvailable = false;
    update();

    await _preferences.clear();
  }

  Future<void> saveString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  String getString(String key) => _preferences.getString(key) ?? "";

  void initilizeInfo() {
    name = getString('name');
    address = getString('address');
    pincode = getString('pincode');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInstance();
  }
}
