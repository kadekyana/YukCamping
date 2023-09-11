import 'package:YukCamping/controller/profile_controller.dart';
import 'package:YukCamping/detail_profile.dart';
import 'package:YukCamping/login.dart';
import 'package:YukCamping/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button/custom.dart';
import 'controller/auth_controller.dart';

class Profile extends GetView<Profile_Controller> {
  final auth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 6,
                ),
                child: Obx(() {
                  String photoUrl = auth.userPhotoUrl.value;
                  return CircleAvatar(
                    backgroundImage: photoUrl.isNotEmpty
                        ? NetworkImage(photoUrl) as ImageProvider
                        : AssetImage('assets/default_profile_photo.png'),
                    radius: 70,
                  );
                }),
              ),
            ),
            Obx(
              () => Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 35),
                child: Text(
                  '${auth.userName.value}',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Obx(
              () => Container(
                child: Text(
                  '${auth.userEmail.value}',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                child: Column(children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.detail_profile);
                      },
                      child: Text(
                        'Change Profile',
                        style: TextStyle(fontFamily: 'Poppins'),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        auth.logout();
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(fontFamily: 'Poppins'),
                      )),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
