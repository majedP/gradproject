import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login_page.dart';
import 'changePass.dart';
import 'profile_page.dart';
import 'write_text_page.dart';
import 'view_texts_page.dart'; // Ensure this is properly imported
import 'main.dart'; // This is assumed to contain your WelcomeScreen

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0, // Removes the shadow under the app bar
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Profile', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          Divider(color: Colors.white),
          ListTile(
            title:
                Text('Change Password', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangePasswordPage()),
              );
            },
          ),
          Divider(color: Colors.white),
          ListTile(
            title:
                Text('View Saved Texts', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewTextsPage()),
              );
            },
          ),
          Divider(color: Colors.white),
          ListTile(
            title: Text('Log out', style: TextStyle(color: Colors.white)),
            onTap: () async {
              await Supabase.instance.client.auth.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
