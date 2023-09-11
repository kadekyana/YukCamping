import 'dart:io';

import 'package:YukCamping/button/custom.dart';
import 'package:YukCamping/controller/auth_controller.dart';
import 'package:YukCamping/controller/profile_controller.dart';
import 'package:YukCamping/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navbar.dart';

class Detail_Profile extends GetView<Profile_Controller> {
  final TextEditingController nameController = TextEditingController();
  final auth = Get.find<AuthController>();
  final RxBool isPasswordVisible = false.obs;
  void _togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Change Profile'),
          backgroundColor: Colors.lightGreen[400],
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 700,
            child: Column(children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 10),
                child: Center(
                  child: Obx(() {
                    String photoUrl = auth.userPhotoUrl.value;
                    print(
                        photoUrl); // Tambahkan pernyataan ini untuk mencetak nilai photoUrl
                    return CircleAvatar(
                      backgroundImage: photoUrl.isNotEmpty
                          ? NetworkImage(photoUrl) as ImageProvider
                          : AssetImage('assets/default_profile_photo.png'),
                      radius: 70,
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GetBuilder<Profile_Controller>(
                      builder: (controller) => controller.picselect != null
                          ? Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: FileImage(
                                        File(controller.picselect!.path)),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () => controller.deleteImage(),
                                    icon: Icon(Icons.delete)),
                              ],
                            )
                          : Text('No Image'),
                    ),
                    TextButton(
                        onPressed: () => controller.selectImage(),
                        child: Text('Choose')),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextField(
                        controller: controller.nameC,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(width: 3)),
                            hintText: "Change Your Name",
                            labelText: "Name"),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextField(
                        controller: controller.emailC,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(width: 3)),
                            hintText: "Change Your Email",
                            labelText: "Email"),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
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
                  ],
                ),
              ),
              Custom(
                  isi: 'Changes',
                  warnabg: Colors.lightGreen,
                  onPressed: () {
                    String name = controller.nameC.text.trim();
                    String password = controller.passC.text.trim();
                    String email = controller.emailC.text.trim();
                    controller
                        .uploadImage(auth.userEmail.value)
                        .then((photoUrl) {
                      if (photoUrl != null) {
                        auth.updateProfile(name, password, email, photoUrl);
                      }
                    });
                  }),
              SizedBox(
                height: 100,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
