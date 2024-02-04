// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rentacar/view/login_view.dart';
import 'package:rentacar/view/profile_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Image.asset(
            "images/applogo.png",
            height: 400,
            width: 500,
            alignment: Alignment.center,
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileView()),
              );
            },
          ),
          ListTile(
            title: const Text('Log out'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              );
            },
          ),
        ],
      ),
    );
  }
}
