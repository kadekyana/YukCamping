import 'dart:io';

import 'package:YukCamping/controller/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Profile_Controller extends GetxController {
  final auth = Get.find<AuthController>();
  final RxString userName = ''.obs;
  final RxString userPhotoUrl = ''.obs;
  late TextEditingController emailC;
  late TextEditingController nameC;
  late TextEditingController passC;
  late ImagePicker picker;

  FirebaseStorage storage = FirebaseStorage.instance;

  XFile? picselect = null;

  Future<String?> uploadImage(String email) async {
    Reference storageRef = storage.ref('$email.jpg');
    File file = File(picselect!.path);

    try {
      await storageRef.putFile(file);
      final photoUrl = await storageRef.getDownloadURL();
      deleteImage();
      return photoUrl;
    } catch (err) {
      print(err);
      return null;
    }
  }

  void selectImage() async {
    try {
      final select = await picker.pickImage(source: ImageSource.gallery);

      if (select != null) {
        print(select.name);
        print(select.path);
        picselect = select;
      }
      update();
    } catch (err) {
      print(err);
      picselect = null;
      update();
    }
  }

  void deleteImage() {
    picselect = null;
    update();
  }

  @override
  void onInit() {
    emailC = TextEditingController(text: '${auth.userEmail.value}');
    nameC = TextEditingController(text: '${auth.userName.value}');
    passC = TextEditingController();
    picker = ImagePicker();
    super.onInit();
  }

  @override
  void onClose() {
    emailC.dispose();
    nameC.dispose();
    passC.dispose();
    super.onClose();
  }
}
