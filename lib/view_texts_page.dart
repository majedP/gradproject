import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/services.dart';

class ViewTextsPage extends StatefulWidget {
  @override
  _ViewTextsPageState createState() => _ViewTextsPageState();
}

class _ViewTextsPageState extends State<ViewTextsPage> {
  List<String> texts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTexts();
  }

  Future<void> fetchTexts() async {
    setState(() {
      isLoading = true;
    });

    final user = Supabase.instance.client.auth.currentUser;
    final response = await Supabase.instance.client
        .from('ai_texts')
        .select('text')
        .eq('user_id', user!.id);

    if (response != null) {
      List<dynamic> data = response as List<dynamic>;
      texts = data.map((e) => e['text'] as String).toList();
    }

    setState(() {
      isLoading = false;
    });
  }

  void _showText(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Text Content'),
          content: Text(text),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
              style: TextButton.styleFrom(
                primary: Colors.red,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: text));
                Navigator.of(context)
                    .pop(); // Optional: Close the dialog after copying
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Text copied to clipboard!")));
              },
              child: Text('Copy'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Button background color
                onPrimary: Colors.white, // Button text color
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Saved Ai Texts"),
        backgroundColor: Colors.black,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: texts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text(texts[index], style: TextStyle(color: Colors.white)),
                  onTap: () =>
                      _showText(texts[index]), // Action when text is tapped
                );
              },
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.grey, height: 1),
            ),
    );
  }
}
