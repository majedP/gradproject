import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'EHomepage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> _register(BuildContext context) async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    final response = await Supabase.instance.client.auth.signUp(
      email: _emailController.text,
      password: _passwordController.text,
    );

    // Check if the registration process resulted in a user being created or not
    if (response.user != null) {
      // Navigate to EmailHomepage if the user is created
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => EmailHomepage()),
      );
    } else {
      // Show a generic error message if registration fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed, please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Image.asset(
                'assets/images/Registepp.png', // Ensure this image asset is available in your project
                width: MediaQuery.of(context).size.width * 0.7,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 32),
              _buildCaptionedTextInputField(
                  context, 'Email Address', _emailController),
              _buildCaptionedTextInputField(
                  context, 'Password', _passwordController,
                  isPassword: true),
              _buildCaptionedTextInputField(
                  context, 'Confirmation Password', _confirmPasswordController,
                  isPassword: true),
              _buildCaptionedTextInputField(
                  context, 'Mobile Phone', _phoneController),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _register(context),
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCaptionedTextInputField(
    BuildContext context,
    String label,
    TextEditingController controller, {
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter your $label',
              filled: true,
              fillColor: Color.fromARGB(255, 25, 53, 28),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
            obscureText: isPassword,
            keyboardType:
                isPassword ? TextInputType.text : TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}
