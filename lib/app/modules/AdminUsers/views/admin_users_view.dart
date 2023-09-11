import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_users_controller.dart';

class AdminUsersView extends GetView<AdminUsersController> {
  const AdminUsersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminUsersView'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, Index) => ListTile(
          title: Text(
            'Name User',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
          subtitle: Text('Email'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
