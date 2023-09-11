// import 'package:YukCamping/button/custom_simple.dart';
// import 'package:YukCamping/controller/auth_controller.dart';
// import 'package:YukCamping/controller/cart.dart';
// import 'package:YukCamping/controller/cart_controller.dart';
// import 'package:YukCamping/keranjang/cart_item.dart';
// import 'package:YukCamping/keranjang/cart_screen.dart';
// import 'package:YukCamping/keranjang/cart_total.dart';
// import 'package:YukCamping/keranjang/cart.dart';
// import 'package:YukCamping/detail_pruduct.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:get/get.dart';

// class Core extends StatefulWidget {
//   Core({Key? key}) : super(key: key);

//   @override
//   State<Core> createState() => _CoreState();
// }

// class _CoreState extends State<Core> {
//   final cartC = Get.put(CartC());
//   final cartController = Get.put(CartController());
//   final auth = Get.find<AuthController>();

//   @override
//   void initState() {
//     super.initState();
//     auth.chechAuthStatus();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 100,
//                 padding: EdgeInsets.only(top: 20, left: 25, right: 25),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Obx(() {
//                           print(auth.userName.value);
//                           return Text(
//                             'Hello ${auth.userName.value}',
//                             style: TextStyle(
//                               fontFamily: "Poppins",
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           );
//                         }),
//                       ],
//                     ),
//                     Container(
//                       width: double.infinity,
//                       alignment: Alignment.centerLeft,
//                       child: Text("Let's get equipment"),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 200,
//                 margin: EdgeInsets.only(top: 10, bottom: 10),
//                 width: double.infinity,
//                 child: Image(
//                   image: AssetImage('assets/banner.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Center(
//                 child: LayoutBuilder(builder: (context, constraints) {
//                   double screenWidth = constraints.maxWidth;
//                   double fontSize = screenWidth * 0.05;
//                   return Text(
//                     'Best Camping For Your',
//                     style: TextStyle(
//                       fontSize: fontSize,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.bold,
//                     ),
//                   );
//                 }),
//               ),
//               SingleChildScrollView(
//                   child: Container(
//                 height: MediaQuery.of(context).size.height * 0.45,
//                 margin: EdgeInsets.only(bottom: 20),
//                 width: 330,
//                 child: Obx(() => Flexible(
//                       child: ListView.builder(
//                         itemCount: cartC.cartItem.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Column(
//                             children: [
//                               Image(
//                                 image: AssetImage(cartC.cartItem[index].ImgSee),
//                               ),
//                               Container(
//                                 height: 50,
//                                 margin: EdgeInsets.only(bottom: 10),
//                                 padding: EdgeInsets.only(bottom: 5),
//                                 width: 330,
//                                 decoration: const BoxDecoration(
//                                   color: Color(0xffFFA500),
//                                   borderRadius: BorderRadius.only(
//                                     bottomLeft: Radius.circular(10),
//                                     bottomRight: Radius.circular(10),
//                                   ),
//                                 ),
//                                 child: ListTile(
//                                   onTap: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: ((context) =>
//                                                 Detail_Product(
//                                                     item: cartC
//                                                         .cartItem[index]))));
//                                   },
//                                   title: Text(
//                                     cartC.cartItem[index].name,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontFamily: 'Poppins',
//                                     ),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                     )),
//               ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:YukCamping/button/custom_simple.dart';
import 'package:YukCamping/controller/auth_controller.dart';
import 'package:YukCamping/controller/cart_controller.dart';
import 'package:YukCamping/keranjang/cart_item.dart';
import 'package:YukCamping/keranjang/cart_screen.dart';
import 'package:YukCamping/keranjang/cart_total.dart';
import 'package:YukCamping/keranjang/cart.dart';
import 'package:YukCamping/detail_pruduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class Core extends StatefulWidget {
  const Core({super.key});

  @override
  State<Core> createState() => _Core();
}

class _Core extends State<Core> {
  final cartController = Get.put(CartController());
  final auth = Get.find<AuthController>();
  @override
  void iniState() {
    super.initState();
    auth.chechAuthStatus();
  }

  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          print(auth.userName.value);
                          return Text(
                            'Hello ${auth.userName.value}',
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          );
                        }),
                        IconButton(
                          onPressed: () {
                            Get.to(CartScreen());
                          },
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Let's get equipment",
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 200,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                width: double.infinity,
                child: Image(
                  image: AssetImage('assets/banner.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: LayoutBuilder(builder: (context, constraints) {
                  double screenWidth = constraints.maxWidth;

                  double fontSize = screenWidth * 0.05;

                  return Text(
                    'Best Camping For Your',
                    style: TextStyle(
                        fontSize: fontSize,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  );
                }),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      margin: EdgeInsets.only(bottom: 20),
                      width: 330,
                      child: ListView.builder(
                        itemCount: CartItem.item.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Image(
                                image: AssetImage(CartItem.item[index].ImgSee),
                              ),
                              Container(
                                height: 50,
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.only(bottom: 5),
                                width: 330,
                                decoration: const BoxDecoration(
                                  color: Color(0xffFFA500),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(Detail_Product(
                                        item: CartItem.item[index]));
                                  },
                                  child: Text(
                                    CartItem.item[index].name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
