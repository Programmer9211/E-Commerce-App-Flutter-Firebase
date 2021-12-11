import 'package:e_commerce/address/adress_screen_controller.dart';
import 'package:e_commerce/confirmation/confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdressScreenController>(
        init: AdressScreenController(),
        builder: (value) {
          if (value.isAddressAvailable) {
            return EditAddressScreen();
          } else {
            return AddAdressScreen();
          }
        });
  }
}

class AddAdressScreen extends StatelessWidget {
  AddAdressScreen({Key? key}) : super(key: key);

  final controller = Get.find<AdressScreenController>();

  @override
  Widget build(BuildContext context) {
    final size = Get.size;

    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: Text("Address"),
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 30,
                ),
                SizedBox(
                  height: size.height / 10,
                  width: size.width / 1.1,
                  child: TextField(
                    controller: controller.nameController,
                    maxLength: 15,
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                SizedBox(
                  height: size.height / 5,
                  width: size.width / 1.1,
                  child: TextField(
                    controller: controller.addressController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                SizedBox(
                  height: size.height / 10,
                  width: size.width / 1.1,
                  child: TextField(
                    controller: controller.pincodeController,
                    maxLength: 6,
                    decoration: InputDecoration(
                      hintText: "Pincode",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              controller.onTap();
            },
            child: Container(
              height: size.height / 12,
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditAddressScreen extends StatelessWidget {
  EditAddressScreen({Key? key}) : super(key: key);

  final controller = Get.find<AdressScreenController>();

  @override
  Widget build(BuildContext context) {
    final size = Get.size;

    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text("Address"),
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 30,
                ),
                addressCard(size),
              ],
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              Get.to(() => ConfirmationScreen());
            },
            child: Container(
              height: size.height / 12,
              width: size.width / 1.2,
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: const Text(
                "Proceed",
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget addressCard(Size size) {
    return Material(
      elevation: 5,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        width: size.width / 1.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                controller.address,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              controller.pincode,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            GestureDetector(
              onTap: () {
                controller.onEdit();
              },
              child: Container(
                height: size.height / 18,
                width: size.width / 1.2,
                color: Colors.blueAccent,
                alignment: Alignment.center,
                child: const Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
