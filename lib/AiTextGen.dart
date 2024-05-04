import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AiTextGenPage extends StatefulWidget {
  @override
  _AiTextGenPageState createState() => _AiTextGenPageState();
}

class _AiTextGenPageState extends State<AiTextGenPage> {
  final TextEditingController _promptController = TextEditingController();
  String _output = "Waiting to craft your email";

  void _generateOutput() async {
    var response = await http.post(
      Uri.parse('https://p50mtnbsuhdzm3-5000.proxy.runpod.net/chatbot/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'text': _promptController.text,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        _output = jsonDecode(response.body)['response'];
      });
    } else {
      setState(() {
        _output = "Failed to generate output.";
      });
      print('Server error: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:
            Text('Ai Text Generation', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Prompt',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 8),
            _buildPromptInput(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _generateOutput,
              child: Text('Generate'),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[850], // Button color
                onPrimary: Colors.white, // Text color
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Output Generated Text',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 8),
            _buildOutputField(),
          ],
        ),
      ),
    );
  }

  Widget _buildPromptInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _promptController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your prompt here',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        ),
        maxLines: null,
      ),
    );
  }

  Widget _buildOutputField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
      ),
      height: 150, // Fixed height, adjust as needed
      child: SelectableText(
        _output, // Update this with the generated text
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
