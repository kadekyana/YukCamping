import 'package:flutter/material.dart';
import 'package:YukCamping/registrasi.dart';
import 'package:YukCamping/button/custom.dart';
import 'package:get/get.dart';

import 'login.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 375,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color(0xffFEBE00),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            child: const Image(image: AssetImage("assets/1.png")),
          ),
          Container(
            height: 160,
            width: 400,
            child: const Center(
              child: Text(
                "Search Your Favorite Camping Spot",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 300,
            margin: EdgeInsets.only(bottom: 30),
            child: Column(
              children: [
                Text(
                  "Discover the Great Outdoors",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Your Ultimate Camping Companion!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Custom(
            isi: '    Login    ',
            warnabg: Colors.amber,
            onPressed: () {
              Get.to(Login());
            },
          ),
          Custom(
              isi: 'Register',
              warnabg: Colors.black26,
              onPressed: () {
                Get.to(Registrasi());
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Registrasi()));
              })
        ],
      )),
    );
  }
}
