import 'package:flutter/material.dart';
import 'EHomepage.dart';

class RegisterPage extends StatelessWidget {
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
                'assets/images/Registepp.png', // Replace with your image asset
                width: MediaQuery.of(context).size.width * 0.7,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 32),
              _buildCaptionedTextInputField(context, 'Email Address'),
              _buildCaptionedTextInputField(context, 'Password',
                  isPassword: true),
              _buildCaptionedTextInputField(context, 'Confirmation Password',
                  isPassword: true),
              _buildCaptionedTextInputField(context, 'Mobile Phone'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmailHomepage()),
                  );
                },
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

  Widget _buildCaptionedTextInputField(BuildContext context, String label,
      {bool isPassword = false}) {
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
            decoration: InputDecoration(
              hintText: 'Enter your $label',
              filled: true,
              fillColor: Colors.white,
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
