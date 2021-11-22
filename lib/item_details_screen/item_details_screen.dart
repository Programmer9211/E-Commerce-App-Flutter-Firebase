import 'package:e_commerce/cart_screen/cart_screen.dart';
import 'package:e_commerce/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemScreenDetails extends StatelessWidget {
  const ItemScreenDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;

    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(() => const CartScreen());
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
                      itemCount: 3,
                      //onPageChanged: controller.changeIndicator,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(image),
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
                        for (int i = 0; i < 3; i++) indicator(size, false)
                      ],
                    ),
                  ),

                  SizedBox(
                    height: size.height / 25,
                  ),

                  SizedBox(
                    width: size.width / 1.1,
                    child: const Text(
                      "LED TV",
                      style: TextStyle(
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
                        text: "48,000",
                        style: const TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.lineThrough),
                        children: [
                          TextSpan(
                            text: " 36,000",
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.grey[800],
                              decoration: TextDecoration.none,
                            ),
                          ),
                          const TextSpan(
                            text: " 25% off",
                            style: TextStyle(
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
                    child: const Text(
                      description,
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
                      size, () {}, Colors.redAccent, "Add to Cart"),
                ),
                Expanded(
                  child: customButtom(size, () {}, Colors.white, "Buy Now"),
                ),
              ],
            ),
          ),
        ),
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
