import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login_page.dart'; // Make sure to import your actual login page
import 'changePass.dart';
import 'profile_page.dart';
import 'main.dart'; // Import main.dart to access WelcomeScreen

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
      body: Column(
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
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey, // Button color
                    onPrimary: Colors.black, // Text color
                  ),
                  onPressed: () async {
                    await Supabase.instance.client.auth.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WelcomeScreen()), // Navigate back to WelcomeScreen
                    );
                  },
                  child: SizedBox(
                    width:
                        double.infinity, // Makes the button take the full width
                    child: Text(
                      'Log out',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
