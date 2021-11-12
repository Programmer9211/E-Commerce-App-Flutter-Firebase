import 'package:e_commerce/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;

    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text("Electronics"),
          backgroundColor: Colors.blueAccent,
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                height: size.height / 40,
              ),
              searchBar(size),
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return listViewBuilderItems(size);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget listViewBuilderItems(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Container(
        height: size.height / 8,
        width: size.width / 1.1,
        child: Row(
          children: [
            Container(
              height: size.height / 8,
              width: size.width / 4.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                ),
              ),
            ),
            SizedBox(
              width: size.width / 22,
            ),
            Expanded(
              child: SizedBox(
                child: RichText(
                  text: const TextSpan(
                    text: "Item Name\n",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "Price",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: " 20% off",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBar(Size size) {
    return GestureDetector(
      onTap: () {},
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
        child: Container(
          height: size.height / 14,
          width: size.width / 1.1,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Search Here...",
                style: TextStyle(fontSize: 16),
              ),
              Icon(
                Icons.search,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
