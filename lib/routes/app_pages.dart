import 'package:YukCamping/app/modules/AdminDes/bindings/admin_des_binding.dart';
import 'package:YukCamping/app/modules/AdminDes/views/admin_des_view.dart';
import 'package:YukCamping/app/modules/AdminUsers/bindings/admin_users_binding.dart';
import 'package:YukCamping/app/modules/AdminUsers/views/admin_users_view.dart';
import 'package:YukCamping/app/modules/EditDes/bindings/edit_des_binding.dart';
import 'package:YukCamping/app/modules/EditDes/views/edit_des_view.dart';
import 'package:YukCamping/app/modules/TambahDes/bindings/tambah_des_binding.dart';
import 'package:YukCamping/app/modules/TambahDes/views/tambah_des_view.dart';
import 'package:YukCamping/binding/cart_binding.dart';
import 'package:YukCamping/binding/product_binding.dart';
import 'package:YukCamping/binding/profile_binding.dart';
import 'package:YukCamping/core.dart';
import 'package:YukCamping/detail_profile.dart';
import 'package:YukCamping/detail_pruduct.dart';
import 'package:YukCamping/keranjang/cart.dart';
import 'package:YukCamping/keranjang/cart_item.dart';
import 'package:YukCamping/keranjang/cart_screen.dart';
import 'package:YukCamping/login.dart';
import 'package:YukCamping/profile.dart';
import 'package:YukCamping/registrasi.dart';
import 'package:YukCamping/splash.dart';
import 'package:YukCamping/splash_core.dart';
import 'package:get/get.dart';
import '../binding/login_binding.dart';
import '../binding/registrasi_binding.dart';
import '../navbar.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = AppRoutes.splash;

  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => Splash(), bindings: <Bindings>[
      Login_Binding(),
      Registrasi_Binding(),
      Cart_Binding(),
      Profile_Binding()
    ]),
    GetPage(
        name: AppRoutes.splash_core,
        page: () => Splash_Core(),
        bindings: <Bindings>[
          Login_Binding(),
          Registrasi_Binding(),
          Cart_Binding(),
          Profile_Binding()
        ]),
    GetPage(
        name: AppRoutes.login,
        page: () => Login(),
        bindings: <Bindings>[Login_Binding(), Registrasi_Binding()]),
    GetPage(
        name: AppRoutes.register,
        page: () => Registrasi(),
        bindings: <Bindings>[Login_Binding(), Registrasi_Binding()]),
    GetPage(name: AppRoutes.navbar, page: () => Navbar(), bindings: <Bindings>[
      Login_Binding(),
      Registrasi_Binding(),
      Cart_Binding(),
      Profile_Binding()
    ]),
    GetPage(
        name: AppRoutes.cart,
        page: () => Cart(),
        bindings: <Bindings>[Cart_Binding()]),
    GetPage(
        name: AppRoutes.core,
        page: () => Core(),
        bindings: <Bindings>[Cart_Binding()]),
    GetPage(
        name: AppRoutes.cart_screen,
        page: () => CartScreen(),
        bindings: <Bindings>[Cart_Binding()]),
    GetPage(
        name: AppRoutes.profile,
        page: () => Profile(),
        bindings: <Bindings>[Profile_Binding()]),
    GetPage(
        name: AppRoutes.detail_profile,
        page: () => Detail_Profile(),
        bindings: <Bindings>[Profile_Binding()]),
    GetPage(
        name: AppRoutes.EDITDES,
        page: () => EditDesView(
              data: 'null',
            ),
        bindings: <Bindings>[EditDesBinding(), AdminDesBinding()]),
    GetPage(
        name: AppRoutes.admindes,
        page: () => AdminDesView(),
        bindings: <Bindings>[AdminDesBinding()]),
    GetPage(
        name: AppRoutes.adminusers,
        page: () => AdminUsersView(),
        bindings: <Bindings>[AdminUsersBinding()]),
    GetPage(
        name: AppRoutes.tambahdes,
        page: () => TambahDesView(),
        bindings: <Bindings>[TambahDesBinding(), AdminDesBinding()]),
  ];
}
