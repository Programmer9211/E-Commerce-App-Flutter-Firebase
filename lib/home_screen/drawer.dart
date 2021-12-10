import 'package:e_commerce/my_orders/my_orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Name"),
            accountEmail: Text("email@gmail.com"),
            currentAccountPicture: Icon(
              Icons.account_circle,
              size: 75,
              color: Colors.white,
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(() => const MyOrdersScreen());
            },
            leading: const Icon(Icons.shopping_bag),
            title: const Text(
              "My Orders",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
