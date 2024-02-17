import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_news_app/splash_page.dart';
import '../login/login_page.dart';
import 'news_page.dart';

class DrawerMenu extends StatelessWidget {
  final String email;
  const DrawerMenu({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Your email ID'),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewsHomePage(
                            email: email,
                          )));
            },
            leading: Icon(
              Icons.home,
              color: Colors.grey.shade700,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.favorite, color: Colors.grey.shade700),
            title: Text(
              'Favorites',
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.notifications,
              color: Colors.grey.shade700,
            ),
            title: Text(
              'Notifications',
              style: TextStyle(color: Colors.grey.shade700),
            ),
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: const Center(
                  child: Text(
                    '9',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.share,
              color: Colors.grey.shade700,
            ),
            title: Text(
              'Share',
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.settings,
              color: Colors.grey.shade700,
            ),
            title: Text(
              'Settings',
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.description,
              color: Colors.grey.shade700,
            ),
            title: Text(
              'Policies',
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          ListTile(
            onTap: () async {
              final sharedPref = await SharedPreferences.getInstance();
              sharedPref.remove(SplashPageState.KEYLOGIN);

              if (context.mounted) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              }
            },
            leading: Icon(
              Icons.logout,
              color: Colors.grey.shade700,
            ),
            title: Text(
              'Log Out',
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            onTap: () {
              SystemNavigator.pop();
            },
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.grey.shade700,
            ),
            title: Text(
              'Exit',
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
        ],
      ),
    );
  }
}
