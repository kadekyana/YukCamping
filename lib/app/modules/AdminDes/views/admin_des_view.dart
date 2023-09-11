import 'package:YukCamping/app/modules/EditDes/views/edit_des_view.dart';
import 'package:YukCamping/app/modules/TambahDes/controllers/tambah_des_controller.dart';
import 'package:YukCamping/app/modules/TambahDes/views/tambah_des_view.dart';
import 'package:YukCamping/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_des_controller.dart';

class AdminDesView extends GetView<AdminDesController> {
  AdminDesView({Key? key}) : super(key: key);
  final AdminDesController controller = Get.put(AdminDesController());
  final TambahDesController controllerT = Get.put(TambahDesController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AdminUsersView'),
          centerTitle: true,
        ),
        // // OneTime Db
        // body: FutureBuilder<QuerySnapshot<Object?>>(
        //     future: controller.getData(),
        //     builder: (context, snapshot) {
        //       var listAlldoc = snapshot.data?.docs;
        //       if (snapshot.connectionState == ConnectionState.done) {
        //         return ListView.builder(
        //           itemCount: listAlldoc?.length,
        //           itemBuilder: (context, index) => ListTile(
        //             title: Text(
        //               '${(listAlldoc![index].data() as Map<String, dynamic>)["name"]}',
        //               style: TextStyle(
        //                   fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        //             ),
        //             subtitle: Text(
        //               '${(listAlldoc[index].data() as Map<String, dynamic>)["decs"]}',
        //               maxLines: 2,
        //             ),
        //           ),
        //         );
        //       } else {
        //         return Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       }
        //     }),
        // Realtime Db
        body: StreamBuilder<QuerySnapshot<Object?>>(
            stream: controller.streamData(),
            builder: (context, snapshot) {
              var listAlldoc = snapshot.data?.docs;
              if (snapshot.connectionState == ConnectionState.active) {
                return ListView.builder(
                  itemCount: listAlldoc?.length,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () =>
                        Get.to(EditDesView(data: listAlldoc[index].id)),
                    title: Text(
                      '${(listAlldoc![index].data() as Map<String, dynamic>)["name"]}',
                      style: TextStyle(
                          fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${(listAlldoc[index].data() as Map<String, dynamic>)["decs"]}',
                      maxLines: 2,
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(TambahDesView()),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
