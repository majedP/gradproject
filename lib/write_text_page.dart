import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WriteTextPage extends StatefulWidget {
  @override
  _WriteTextPageState createState() => _WriteTextPageState();
}

class _WriteTextPageState extends State<WriteTextPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Write Text"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textController,
              maxLines: 10, // Allows for multi-line input
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Write something...",
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveText,
              child: Text('Save Text'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Button color
                onPrimary: Colors.white, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveText() async {
    if (_textController.text.isNotEmpty) {
      final response = await Supabase.instance.client
          .from('ai_texts')
          .insert({'text': _textController.text});

      if (response == null) {
        _textController
            .clear(); // Clear the text field only if there's no error
      }
    }
  }
}
