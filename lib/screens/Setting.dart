import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tidal/auth/auth_service.dart';
import 'package:tidal/screens/login.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final authService = AuthService();

  void logout() async {
    await authService.signOut();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Spacer(),
                Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Nationale',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 20,
                )
              ],
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              title: Text(
                'Audio & Playback',
                style: TextStyle(
                  fontFamily: 'Nationale',
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(IconlyLight.arrow_right_2),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              title: Text(
                'Downloads',
                style: TextStyle(
                  fontFamily: 'Nationale',
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(IconlyLight.arrow_right_2),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              title: Text(
                'Connect',
                style: TextStyle(
                  fontFamily: 'Nationale',
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(IconlyLight.arrow_right_2),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              title: Text(
                'Manage account',
                style: TextStyle(
                  fontFamily: 'Nationale',
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(IconlyLight.arrow_right_2),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              title: Text(
                'My content',
                style: TextStyle(
                  fontFamily: 'Nationale',
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(IconlyLight.arrow_right_2),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              title: Text(
                'Help center',
                style: TextStyle(
                  fontFamily: 'Nationale',
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(IconlyLight.arrow_right_2),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              title: Text(
                'Beta features',
                style: TextStyle(
                  fontFamily: 'Nationale',
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(IconlyLight.arrow_right_2),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              title: Text(
                'Privacy Notice',
                style: TextStyle(
                  fontFamily: 'Nationale',
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(IconlyLight.arrow_right_2),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              title: Text(
                'Privacy preferences',
                style: TextStyle(
                  fontFamily: 'Nationale',
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(IconlyLight.arrow_right_2),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              title: Text(
                'Terms & Conditions',
                style: TextStyle(
                  fontFamily: 'Nationale',
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(IconlyLight.arrow_right_2),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: logout,
              child: Text(
                'Log out',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Nationale',
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'Version 2.147.0,build:7525',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Nationale',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
