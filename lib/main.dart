import 'package:YukCamping/app/modules/admin/views/admin_view.dart';
import 'package:YukCamping/controller/auth_controller.dart';
import 'package:YukCamping/navbar_admin.dart';
import 'package:YukCamping/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'loadview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Dashboard Admin',
//       home: NavbarAdmin(),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authC.streamAuthStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          print(snapshot.data);
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "YukCamp",
            initialRoute: snapshot.data != null
                ? AppRoutes.splash_core
                : AppRoutes.splash,
            getPages: AppPages.routes,
          );
        }
        return Loadview();
      },
    );
  }
}
