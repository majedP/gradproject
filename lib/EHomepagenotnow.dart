import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmailInboxPage(),
    );
  }
}

class EmailInboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Scaffold background color set to black
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.menu, color: Colors.white),
        actions: [Icon(Icons.search, color: Colors.white)],
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    child: Text('Inbox', style: TextStyle(color: Colors.white)),
                    onPressed: () {/* ... */},
                  ),
                  TextButton(
                    child: Text('Sent', style: TextStyle(color: Colors.grey)),
                    onPressed: () {/* ... */},
                  ),
                  TextButton(
                    child: Text('Draft', style: TextStyle(color: Colors.grey)),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4, // Assuming there are four emails
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: index % 2 == 0
                      ? Colors.black
                      : Colors.grey[900], // Alternating tile color
                  title: Text(
                    'Majed Balubaid',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    'Re: Today\'s AbsentAbsent\nHello Dr Ahmad, I wanted to sending you an email talking about Today\'s Absent 11 of jan .....',
                    style: TextStyle(color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // BottomNavigationBar background color
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline, color: Colors.grey),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send_outlined, color: Colors.grey),
            label: 'Sent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.drafts_outlined, color: Colors.grey),
            label: 'Draft',
          ),
        ],
      ),
    );
  }
}
