part of 'app_pages.dart';

abstract class AppRoutes {
  AppRoutes._();
  static const splash = _Paths.splash;
  static const core = _Paths.core;
  static const splash_core = _Paths.splash_core;
  static const navbar = _Paths.navbar;
  static const home = _Paths.home;
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const catalog = _Paths.catalog;
  static const detail = _Paths.detail;
  static const cart = _Paths.cart;
  static const cart_screen = _Paths.cart_screen;
  static const detail_profile = _Paths.detail_profile;
  static const profile = _Paths.profile;
  static const EDITDES = _Paths.editdes;
  static const admindes = _Paths.admindes;
  static const adminusers = _Paths.adminusers;
  static const tambahdes = _Paths.tambahdes;
}

abstract class _Paths {
  _Paths._();
  static const splash = '/splash';
  static const core = '/core';
  static const splash_core = '/splash_core';
  static const navbar = '/navbar';
  static const home = '/home';
  static const login = '/login';
  static const register = '/register';
  static const catalog = '/catalog';
  static const detail = '/detail';
  static const cart = '/cart';
  static const cart_screen = '/cart_screen';
  static const detail_profile = '/detail_profile';
  static const profile = '/profile';
  static const editdes = '/editdes';
  static const admindes = '/admindes';
  static const adminusers = '/eadminusers';
  static const tambahdes = '/tambahdes';
}
