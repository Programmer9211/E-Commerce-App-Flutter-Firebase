import 'package:flutter/material.dart';

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
            onTap: () {},
            leading: const Icon(Icons.shopping_cart),
            title: const Text(
              "Cart",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.shopping_cart),
            title: const Text(
              "Cart",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.shopping_cart),
            title: const Text(
              "Cart",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.shopping_cart),
            title: const Text(
              "Cart",
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
