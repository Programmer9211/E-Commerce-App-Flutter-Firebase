import 'dart:ui';

import 'package:e_commerce/authentication/login_screen/login_screen_controller.dart';
import 'package:e_commerce/const/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final controller = Get.put(LoginScreenController());

    return Container(
      color: Colors.blueAccent,
      child: SafeArea(
        child: Scaffold(
            body: GetBuilder<LoginScreenController>(
                init: LoginScreenController(),
                builder: (value) {
                  if (!value.isLoading) {
                    return SizedBox(
                      height: size.height,
                      width: size.width,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Material(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(100),
                              ),
                              color: const Color.fromRGBO(230, 233, 250, 1),
                              child: SizedBox(
                                height: size.height / 2,
                                width: size.width,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: size.height / 10,
                                    ),
                                    Text(
                                      "E-Commerce",
                                      style: TextStyle(
                                          letterSpacing: 1.2,
                                          color: const Color.fromRGBO(
                                              9, 32, 196, 1),
                                          fontSize: size.width / 9,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: size.height / 60,
                                    ),
                                    Text(
                                      "'It's all easy when it's at Home'",
                                      style: TextStyle(
                                        color: const Color.fromRGBO(
                                            90, 106, 165, 1),
                                        fontSize: size.width / 21,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height / 9,
                                    ),
                                    SizedBox(
                                      width: size.width / 1.2,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: size.height / 10,
                                            width: size.width / 150,
                                            color: const Color.fromRGBO(
                                                9, 32, 196, 1),
                                          ),
                                          SizedBox(
                                            width: size.width / 40,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: "Welcome\n",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: size.width / 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      "Enter the Fetails to login/Signup.",
                                                  style: TextStyle(
                                                    color: const Color.fromRGBO(
                                                        138, 132, 134, 1),
                                                    fontSize: size.width / 22,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 15,
                            ),
                            Container(
                              height: size.height / 15,
                              width: size.width / 1.2,
                              padding: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1,
                                  color: const Color.fromRGBO(9, 32, 196, 1),
                                ),
                              ),
                              child: TextField(
                                controller: controller.phone,
                                maxLength: 10,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Phone Number",
                                  counterText: "",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 10,
                            ),
                            CustomButton(
                              text: "Login/SignUp",
                              buttonWidth: 2.2,
                              function: () {
                                controller.verifyPhoneNumber();
                              },
                              radius: BorderRadius.circular(10),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })),
      ),
    );
  }
}
