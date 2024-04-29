import 'package:flutter/material.dart';

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
              // Navigate to Profile settings
            },
          ),
          Divider(color: Colors.white),
          ListTile(
            title:
                Text('Change Password', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Navigate to Change Password settings
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
                  onPressed: () {
                    // Implement logout functionality
                    // Usually, you would clear user data and navigate to the login screen
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
