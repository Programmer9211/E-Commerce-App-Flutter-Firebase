import 'package:e_commerce/const/const.dart';
import 'package:e_commerce/my_orders/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrderDetailsScreen extends StatelessWidget {
  final MyOrdersModel model;
  const MyOrderDetailsScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;

    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(model.name),
            backgroundColor: Colors.blueAccent,
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Container(
                    height: size.height / 5,
                    width: size.width / 1.1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(model.image),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Text(
                    model.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  orderDetails(size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget orderDetails(Size size) {
    Widget text(String header, String footer) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            footer,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }

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
            const Text(
              "Order Details",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: size.height / 40,
            ),
            text('Order Id :', model.orderId),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: text('Total Price :', model.totalPrice.toString()),
            ),
            text('Paid amount :', model.paidAmount.toString()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child:
                  text('Status :', model.status == 0 ? 'Pending' : 'Delivered'),
            ),
            text('Ordered on :', '11-12-2021'),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 12),
            //   child: text('Delivered on :', '28-10-2021'),
            // ),
          ],
        ),
      ),
    );
  }
}
