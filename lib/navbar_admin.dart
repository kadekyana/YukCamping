import 'package:YukCamping/app/modules/AdminDes/views/admin_des_view.dart';
import 'package:YukCamping/app/modules/AdminUsers/views/admin_users_view.dart';
import 'package:YukCamping/app/modules/admin/views/admin_view.dart';
import 'package:YukCamping/camp.dart';
import 'package:YukCamping/core.dart';
import 'package:YukCamping/profile.dart';
import 'package:flutter/material.dart';

class NavbarAdmin extends StatefulWidget {
  const NavbarAdmin({super.key});

  @override
  State<NavbarAdmin> createState() => _NavbarAdmin();
}

class _NavbarAdmin extends State<NavbarAdmin> {
  int _currentIndex = 0;
  List<Widget> body = [AdminView(), AdminDesView(), AdminUsersView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Destination',
            icon: Icon(Icons.map),
          ),
          BottomNavigationBarItem(
            label: 'Users',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
