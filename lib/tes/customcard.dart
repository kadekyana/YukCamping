import 'package:YukCamping/core.dart';
import 'package:YukCamping/profile.dart';
import 'package:YukCamping/tes/tes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;

  CustomCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(Tes());
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}
