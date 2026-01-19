import 'package:cropco/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF667E06),
                Color.fromARGB(255, 155, 184, 38)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: ListTile(),
          ),
          ListTile(
            title: const Text('login'),
            leading: const Icon(Icons.login),
            onTap: () {},
          ),
          ListTile(
            title: const Text('language'),
            leading: const Icon(Icons.language),
            onTap: () {},
          ),
          ListTile(
            title: const Text('fare'),
            leading: const Icon(Icons.agriculture),
            onTap: () {},
          ),
          ListTile(
            title: const Text('My profile'),
            leading: const Icon(Icons.account_circle_outlined),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const ProfileView()));
            },
          ),
          ListTile(
            title: const Text('expense tracker'),
            leading: const Icon(Icons.track_changes),
            onTap: () {
              Get.toNamed('/expense-tracker');
            },
          ),
          ListTile(
            title: const Text('Notification'),
            leading: const Icon(Icons.notification_add),
            onTap: () {},
          ),
          ListTile(
            title: const Text('help'),
            leading: const Icon(Icons.help),
            onTap: () {},
          ),
          ListTile(
            title: const Text('logout'),
            leading: const Icon(Icons.logout),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
