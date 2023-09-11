import 'package:flutter/material.dart';
import 'package:YukCamping/login.dart';
import 'package:get/get.dart';

import 'button/custom.dart';
import 'controller/auth_controller.dart';
import 'controller/registrasi_controller.dart';

class Registrasi extends GetView<Registrasi_Controller> {
  final RxBool isPasswordVisible = false.obs;
  void _togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  final auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 375,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xffFEBE00),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: const Image(image: AssetImage("assets/register.png")),
            ),
            Container(
                margin: const EdgeInsets.only(
                    top: 15, bottom: 20, left: 30, right: 30),
                child: TextField(
                    controller: controller.nameC,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3),
                      ),
                      prefixIcon: Icon(Icons.person),
                      hintText: "Input Your Name",
                      labelText: "Name",
                    ))),
            Container(
                margin: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
                child: TextField(
                    controller: controller.emailC,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3),
                      ),
                      prefixIcon: Icon(Icons.person),
                      hintText: "Input Your Email Register",
                      labelText: "Email",
                    ))),
            Container(
              margin: const EdgeInsets.only(bottom: 50, left: 30, right: 30),
              child: Obx(
                () => TextField(
                  controller: controller.passC,
                  obscureText: !isPasswordVisible.value,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: _togglePasswordVisibility,
                      icon: isPasswordVisible.value
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 3),
                    ),
                    hintText: "Input Your Password",
                    labelText: "Password",
                  ),
                ),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
            //   child: TextField(
            //     obscureText: pass,
            //     decoration: InputDecoration(
            //         suffixIcon: IconButton(
            //             onPressed: () {
            //               setState(() {
            //                 pass = !pass;
            //               });
            //             },
            //             icon: !pass
            //                 ? Icon(Icons.visibility)
            //                 : const Icon(Icons.visibility_off)),
            //         border: const OutlineInputBorder(
            //             borderSide: BorderSide(width: 3)),
            //         hintText: "One More Your Password",
            //         labelText: "Password Match"),
            //   ),
            // ),
            Custom(
              isi: 'Register',
              warnabg: Colors.amber,
              onPressed: () => auth.register(controller.emailC.text,
                  controller.passC.text, controller.nameC.text),
            ),
            Container(
              child: TextButton(
                  onPressed: () {
                    Get.to(Login());
                  },
                  child: const Text("Already Have an Account?, Login")),
            ),
          ]),
        ),
      ),
    );
  }
}
