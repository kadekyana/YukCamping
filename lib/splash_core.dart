import 'package:YukCamping/core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';

import 'navbar.dart';

class Splash_Core extends StatefulWidget {
  const Splash_Core({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Splash createState() => _Splash();
}

class _Splash extends State<Splash_Core> {
  @override
  void initState() {
    super.initState();
    splashStart();
  }

  splashStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () async {
      Get.to(Navbar());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFE69A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Image(image: AssetImage('assets/Logo.png')),
            SizedBox(
              height: 30,
            ),
            Text(
              "YukCamping",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
