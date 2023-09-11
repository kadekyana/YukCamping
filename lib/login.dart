import 'package:YukCamping/controller/auth_controller.dart';
import 'package:YukCamping/navbar.dart';
import 'package:flutter/material.dart';
import 'package:YukCamping/registrasi.dart';
import 'package:get/get.dart';
import 'button/custom.dart';
import 'controller/login_controller.dart';

class Login extends GetView<Login_Controller> {
  final auth = Get.find<AuthController>();
  final RxBool isPasswordVisible = false.obs;
  void _togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

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
              child: const Image(image: AssetImage("assets/login.png")),
            ),
            Container(
                margin: const EdgeInsets.only(
                    top: 50, bottom: 20, left: 30, right: 30)),
            Container(
                margin: EdgeInsets.only(bottom: 20, left: 30, right: 30),
                child: TextField(
                    controller: controller.emailC,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3),
                      ),
                      prefixIcon: Icon(Icons.person),
                      hintText: "Input Your Email",
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
            ElevatedButton(
                onPressed: () {
                  auth.login(controller.emailC.text, controller.passC.text,
                      (result) {
                    if (result) {
                      Get.to(Navbar());
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           Navbar()), // Ganti dengan halaman selanjutnya setelah login berhasil
                      // );
                    } else {
                      print('Login gagal');
                    }
                  });
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontFamily: 'Poppins'),
                )),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Registrasi()),
                  );
                },
                child: const Text("Don't have an account yet? , Register"),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}



// import 'package:YukCamping/controller/auth_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:YukCamping/registrasi.dart';
// import 'package:get/get.dart';
// import 'button/custom.dart';
// import 'controller/login_controller.dart';

// class Login extends GetView<Login_Controller> {
//   final auth = Get.find<AuthController>();
//   final RxBool isPasswordVisible = false.obs;
//   void _togglePasswordVisibility() {
//     isPasswordVisible.toggle();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(children: [
//             Container(
//               height: 375,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                   color: Color(0xffFEBE00),
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(40),
//                       bottomRight: Radius.circular(40))),
//               child: const Image(image: AssetImage("assets/login.png")),
//             ),
//             Container(
//                 margin: const EdgeInsets.only(
//                     top: 50, bottom: 20, left: 30, right: 30)),
//             Container(
//                 margin: EdgeInsets.only(bottom: 20, left: 30, right: 30),
//                 child: TextField(
//                     controller: controller.emailC,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(width: 3),
//                       ),
//                       prefixIcon: Icon(Icons.person),
//                       hintText: "Input Your Email",
//                       labelText: "Email",
//                     ))),
//             Container(
//               margin: const EdgeInsets.only(bottom: 50, left: 30, right: 30),
//               child: Obx(
//                 () => TextField(
//                   controller: controller.passC,
//                   obscureText: !isPasswordVisible.value,
//                   decoration: InputDecoration(
//                     suffixIcon: IconButton(
//                       onPressed: _togglePasswordVisibility,
//                       icon: isPasswordVisible.value
//                           ? const Icon(Icons.visibility)
//                           : const Icon(Icons.visibility_off),
//                     ),
//                     border: const OutlineInputBorder(
//                       borderSide: BorderSide(width: 3),
//                     ),
//                     hintText: "Input Your Password",
//                     labelText: "Password",
//                   ),
//                 ),
//               ),
//             ),
//             Custom(
//                 isi: 'Login',
//                 warnabg: Colors.amber,
//                 onPressed: () {
//                   auth.login(controller.emailC.text, controller.passC.text);
//                 }),
//             Container(
//               child: TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Registrasi(),
//                       ),
//                     );
//                   },
//                   child: const Text("Don't have an account yet? , Register")),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
