import 'package:flutter/material.dart';
import 'EHomepage.dart';

class SentEmailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Sent Emails', style: TextStyle(color: Colors.white)),
        leading: Icon(Icons.menu, color: Colors.white),
        actions: [Icon(Icons.search, color: Colors.white)],
      ),
      body: ListView.builder(
        itemCount: 4, // Number of sent emails
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: index % 2 == 0 ? Colors.black : Colors.grey[900],
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[800],
                child: Text('MB', style: TextStyle(color: Colors.white)),
              ),
              title: Text('Message Subject',
                  style: TextStyle(color: Colors.white)),
              subtitle: Text(
                'Sent message content preview goes here...',
                style: TextStyle(color: Colors.grey),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
      ),
    );
  }
}
