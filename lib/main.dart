import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Supabase package
import 'login_page.dart';
import 'register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for initialization
  await Supabase.initialize(
    url:
        'https://vlndoxzfgkjpxwxykkha.supabase.co', // Replace with your Supabase Project URL
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZsbmRveHpmZ2tqcHh3eHlra2hhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ0NTMyMzUsImV4cCI6MjAzMDAyOTIzNX0.2INpJNAL7K0m7k7luUDSWwSgd_zsqF7r3E0O21dsfCY', // Replace with your Supabase Anon Key
  );
  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Email Assistant',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Image.asset(
              'assets/images/majed.png', // Make sure you have an image with this name in your assets
              width: MediaQuery.of(context).size.width * 0.8,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Experience effortless email writing with our AI text generation. '
                'Let technology craft your messages for you!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text('Register'),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Log In'),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

// The LoginPage and RegisterPage classes should also be defined in their respective files.
