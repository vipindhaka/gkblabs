import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {},
            child: Text('Pages'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Settings'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Logout'),
          ),
        ],
      ),
    ));
  }
}
