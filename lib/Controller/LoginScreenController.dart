import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quantzi/UI/HomeScreen.dart';

import '../ApiConnect.dart';

class LoginScreenController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ApiConnect _connect = Get.put(ApiConnect());
  var token = 'a518bb72fa7cb66a826d80650ca669eeaf73c527';

  @override
  void onInit() {
    super.onInit();
  }

  login(context) async {
    if (userController.value.text.isEmpty ||
        userController.text.toString() != 'iniflutter') {
      Fluttertoast.showToast(
        msg: "Please enter Correct UserName",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    if (passwordController.value.text.isEmpty ||
        passwordController.text.toString() != 'ini@ca') {
      Fluttertoast.showToast(
        msg: "Please enter Correct Password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }
    Map<String, dynamic> payload = {
      'username': userController.text.toString(),
      'password': passwordController.text.toString(),
      'request_token': token
    };
    print('loginPayload:$payload');
    var response = await _connect.loginCall(payload);
    debugPrint("loginCallResponse: ${response.toJson()}");
    if (response != null) {
      Fluttertoast.showToast(
        msg: 'Login Successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      passwordController.text = "";
      userController.text = "";
    } else {
      Fluttertoast.showToast(
        msg: 'Please Check the Credentials',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}
