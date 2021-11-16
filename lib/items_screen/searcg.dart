import 'package:e_commerce/items_screen/item_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'items_model.dart';

class SeachScreen extends SearchDelegate {
  ItemScreenController controller = Get.find();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {}, icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    controller.searchProducts(query);

    return GetBuilder<ItemScreenController>(builder: (value) {
      if (!value.isSearchLoading) {
        return ListView.builder(
          itemCount: value.searchResults.length,
          itemBuilder: (context, index) {
            return listViewBuilderItems(Get.size, value.searchResults[index]);
          },
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    controller.searchProducts(query);

    return GetBuilder<ItemScreenController>(builder: (value) {
      if (!value.isSearchLoading) {
        return ListView.builder(
          itemCount: value.searchResults.length,
          itemBuilder: (context, index) {
            return listViewBuilderItems(Get.size, value.searchResults[index]);
          },
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget listViewBuilderItems(Size size, ItemsModel model) {
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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(model.image),
                ),
              ),
            ),
            SizedBox(
              width: size.width / 22,
            ),
            Expanded(
              child: SizedBox(
                child: RichText(
                  text: TextSpan(
                    text: "${model.title}\n",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "${model.totalPrice}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[800],
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      TextSpan(
                        text: " ${model.sellingPrice}",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      // TextSpan(
                      //   text: " $discount% off",
                      //   style: const TextStyle(
                      //     fontSize: 15,
                      //     color: Colors.green,
                      //   ),
                      // )
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
}
