import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'SettingsPage.dart'; // Make sure the 'SettingsPage.dart' file is in the same directory
import 'AiTextGen.dart';

class EmailHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Scaffold background color set to black
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.menu, color: Colors.white),
        actions: [Icon(Icons.search, color: Colors.white)],
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextButton(
                        child: Text('Inbox',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {/* ... */},
                      ),
                      TextButton(
                        child:
                            Text('Sent', style: TextStyle(color: Colors.grey)),
                        onPressed: () {/* ... */},
                      ),
                      TextButton(
                        child:
                            Text('Draft', style: TextStyle(color: Colors.grey)),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 4, // Number of emails to display
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? Colors.black
                            : Colors.grey[900], // Alternating tile color
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ), // Border between tiles
                        ),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                        leading: CircleAvatar(
                          // Placeholder for profile image
                          backgroundColor: Colors.grey[800],
                          child:
                              Text('MB', style: TextStyle(color: Colors.white)),
                        ),
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
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Use minimum space necessary
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[850], // Dark grey
                      minimumSize:
                          Size(double.infinity, 50), // Full width button
                    ),
                    onPressed: () {
                      // TODO: Add navigation to SettingsPage when the button is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );
                    },
                    child: Text('Settings'),
                  ),
                  SizedBox(height: 8), // Space between buttons
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[850], // Dark grey
                      minimumSize:
                          Size(double.infinity, 50), // Full width button
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AiTextGenPage()),
                      );
                    },
                    child: Text('Ai TextGen'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send_outlined),
            label: 'Sent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.drafts_outlined),
            label: 'Draft',
          ),
        ],
      ),
    );
  }
}
