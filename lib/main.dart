import 'package:flutter/material.dart';
import 'package:navbar/knot/knotMatching.dart'; // Import KnotMatchingPage

void main() {
  runApp(SouleeApp());
}

class SouleeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Placeholder pages for each tab
  final List<Widget> _pages = [
    Center(child: Text('Running Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Notifications Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Social Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Dashboard Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Chat Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Menu Page', style: TextStyle(fontSize: 24))),
  ];

  // Method to handle icon tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/Logo.png',
          height: 80, // Soulee logo in app bar
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Image.asset('assets/Post.png'),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/Search.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Fixed height container for navigation bar
          Container(
            height: 80, // Increased height for the icon row
            color: Colors.grey[200], // Background color for icon row
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: IconButton(
                    icon: Image.asset(
                      _selectedIndex == 0
                          ? 'assets/Activity_Filled.png'
                          : 'assets/Activity.png',
                      height: 50,
                    ),
                    onPressed: () => _onItemTapped(0),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Image.asset(
                      _selectedIndex == 1
                          ? 'assets/Notification_Filled.png'
                          : 'assets/Notification.png',
                      height: 60,
                    ),
                    onPressed: () => _onItemTapped(1),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Image.asset(
                      _selectedIndex == 2
                          ? 'assets/Knot_Filled.png'
                          : 'assets/Knot.png',
                      height: 70,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KnotMatchingPage()),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Image.asset(
                      _selectedIndex == 3
                          ? 'assets/Feed_Filled.png'
                          : 'assets/Feed.png',
                      height: 50,
                    ),
                    onPressed: () => _onItemTapped(3),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Image.asset(
                      _selectedIndex == 4
                          ? 'assets/Chat_Filled.png'
                          : 'assets/Chat.png',
                      height: 50, // Icon size
                    ),
                    onPressed: () => _onItemTapped(4),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Image.asset(
                      _selectedIndex == 5
                          ? 'assets/Menu_Filled.png'
                          : 'assets/Menu.png',
                      height: 50, // Icon size
                    ),
                    onPressed: () => _onItemTapped(5),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: _pages[_selectedIndex],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
