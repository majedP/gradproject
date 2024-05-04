import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'SettingsPage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? userEmail;

  @override
  void initState() {
    super.initState();
    getUserEmail();
  }

  void getUserEmail() {
    final user = Supabase.instance.client.auth.currentUser;
    setState(() {
      userEmail = user?.email ??
          'No email found'; // Safely getting the email or showing a default message
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your current email',
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 69, 69),
                    fontSize: 16)),
            SizedBox(height: 10),
            TextFormField(
              initialValue: userEmail,
              readOnly: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Return'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[850], // Dark grey
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
