import 'package:e_commerce/cart_screen/cart_screen.dart';
import 'package:e_commerce/const/const.dart';
import 'package:e_commerce/item_details_screen/item_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemScreenDetails extends StatelessWidget {
  String id;
  ItemScreenDetails({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    final controller = Get.put(ItemDetailController());

    controller.getItemDetails(id);

    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: GetBuilder<ItemDetailController>(builder: (value) {
          if (!controller.isLoading) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.to(() => CartScreen());
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ],
                backgroundColor: Colors.blueAccent,
              ),
              body: SizedBox(
                height: size.height,
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height / 3.5,
                        width: size.width,
                        child: PageView.builder(
                          itemCount: controller.model.banners.length,
                          //onPageChanged: controller.changeIndicator,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        controller.model.banners[index]),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // indicator

                      SizedBox(
                        height: size.height / 25,
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0;
                                i < controller.model.banners.length;
                                i++)
                              indicator(size, false)
                          ],
                        ),
                      ),

                      SizedBox(
                        height: size.height / 25,
                      ),

                      SizedBox(
                        width: size.width / 1.1,
                        child: Text(
                          controller.model.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: size.height / 35,
                      ),

                      SizedBox(
                        width: size.width / 1.1,
                        child: RichText(
                          text: TextSpan(
                            text: "${controller.model.totalPrice}",
                            style: const TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough),
                            children: [
                              TextSpan(
                                text: " ${controller.model.sellingPrice}",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.grey[800],
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              TextSpan(
                                text: " ${controller.discount}% off",
                                style: const TextStyle(
                                  fontSize: 19,
                                  color: Colors.green,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: size.height / 25,
                      ),

                      SizedBox(
                        width: size.width / 1.1,
                        child: const Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: size.height / 50,
                      ),

                      SizedBox(
                        width: size.width / 1.1,
                        child: Text(
                          controller.model.description,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: size.height / 25,
                      ),

                      ListTile(
                        onTap: () {},
                        title: Text("See Reviews"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        leading: Icon(Icons.star),
                      ),

                      SizedBox(
                        height: size.height / 25,
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: SizedBox(
                height: size.height / 14,
                width: size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: customButtom(
                        size,
                        () {
                          if (controller.isAlreadyAvailable) {
                            Get.to(() => CartScreen());
                          } else {
                            controller.addItemsToCart();
                          }
                        },
                        Colors.redAccent,
                        controller.isAlreadyAvailable
                            ? "Go to Cart"
                            : "Add to Cart",
                      ),
                    ),
                    Expanded(
                      child: customButtom(size, () {}, Colors.white, "Buy Now"),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }),
      ),
    );
  }

  Widget customButtom(Size size, Function function, Color color, String title) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        alignment: Alignment.center,
        color: color,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: color == Colors.redAccent ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget indicator(Size size, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: isSelected ? size.height / 80 : size.height / 100,
        width: isSelected ? size.height / 80 : size.height / 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
    );
  }
}
