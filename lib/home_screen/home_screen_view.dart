import 'package:e_commerce/cart_screen/cart_screen.dart';
import 'package:e_commerce/categories_and_featured_screen/categories_and_featured_screen.dart';
import 'package:e_commerce/home_screen/drawer.dart';
import 'package:e_commerce/home_screen/home_screen_controller.dart';
import 'package:e_commerce/home_screen/model_class/categories_model.dart';
import 'package:e_commerce/items_screen/items_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    final controller = Get.put(HomeScreenController());

    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: GetBuilder<HomeScreenController>(
          builder: (value) {
            if (!value.isLoading) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text("Ecommerce App"),
                  backgroundColor: Colors.blueAccent,
                  actions: [
                    IconButton(
                      onPressed: () {
                        Get.to(() => const CartScreen());
                      },
                      icon: const Icon(Icons.shopping_cart),
                    ),
                  ],
                ),
                drawer: HomeScreenDrawer(),
                body: SizedBox(
                  height: size.height,
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // banner
                        SizedBox(
                          height: size.height / 3.5,
                          width: size.width,
                          child: PageView.builder(
                            itemCount: controller.bannerData.length,
                            onPageChanged: controller.changeIndicator,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          controller.bannerData[index].image),
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
                          child: Obx(() {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0;
                                    i < controller.isSelected.length;
                                    i++)
                                  indicator(
                                      size, controller.isSelected[i].value)
                              ],
                            );
                          }),
                        ),

                        // categories..

                        categoriesTitle(size, "All Categories", () {
                          Get.to(() => CategoriesAndFeaturedScreen(
                                model: controller.categoriesData,
                              ));
                        }),

                        listViewBuilder(size, controller.categoriesData),

                        SizedBox(
                          height: size.height / 25,
                        ),

                        categoriesTitle(size, "Featured", () {
                          Get.to(() => CategoriesAndFeaturedScreen(
                                model: controller.featuredData,
                              ));
                        }),

                        listViewBuilder(size, controller.featuredData),
                      ],
                    ),
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
          },
        ),
      ),
    );
  }

  Widget listViewBuilder(Size size, List<CategoriesModel> data) {
    return SizedBox(
      height: size.height / 7,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return listViewBuilderItems(size, data[index]);
        },
      ),
    );
  }

  Widget listViewBuilderItems(Size size, CategoriesModel categroies) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          Get.to(() => ItemsScreen(
                categoryId: categroies.id,
                categoryTitle: categroies.title,
              ));
        },
        child: SizedBox(
          height: size.height / 7,
          width: size.width / 4.2,
          child: Column(
            children: [
              Container(
                height: size.height / 10,
                width: size.width / 2.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(categroies.image),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Text(
                    categroies.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoriesTitle(Size size, String title, Function function) {
    return SizedBox(
      height: size.height / 17,
      width: size.width / 1.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () => function(),
            child: const Text(
              "View More",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 15,
              ),
            ),
          ),
        ],
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
