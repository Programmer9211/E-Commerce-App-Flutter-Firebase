import 'package:e_commerce/authentication/otp_verification_screen/otp__screen_view.dart';
import 'package:e_commerce/const/const.dart';
import 'package:e_commerce/home_screen/home_screen_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController phone = TextEditingController();
  final TextEditingController otp = TextEditingController();
  String verificationId = "";
  bool isLoading = false;

  void verifyPhoneNumber() async {
    isLoading = true;

    update();

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: "+91${phone.text}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          showAlert("Verifed");
        },
        verificationFailed: (FirebaseAuthException exception) {
          showAlert("Verification Failed");
        },
        codeSent: (String _verificationId, int? forceRespondToken) {
          showAlert("Verification code sent");

          verificationId = _verificationId;
          Get.to(() => const OtpVerificationScreen());
        },
        codeAutoRetrievalTimeout: (String _verificationId) {
          verificationId = _verificationId;
        },
      );
    } catch (e) {
      showAlert("Error Occured : $e");
    }
  }

  void signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp.text,
      );

      var signInUser = await _auth.signInWithCredential(credential);

      final User? user = signInUser.user;

      showAlert("Sign In Sucessfully, User UID : ${user!.uid}");

      Get.to(() => const HomeScreenView());

      print("Sign In Sucessfully, User UID : ${user.uid}");
    } catch (e) {
      showAlert("Error Occured : $e");
    }
  }
}
