import 'package:flutter/material.dart';

class AiTextGenPage extends StatelessWidget {
  final TextEditingController _promptController = TextEditingController();

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
              onPressed: () {
                // TODO: Implement the generate functionality
              },
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
    // TODO: Replace with a dynamic output field that gets updated with the generated text
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
      ),
      height: 150, // Fixed height, adjust as needed
      child: SelectableText(
        '', // Initial text, update this with the generated text
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
