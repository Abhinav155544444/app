import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false; // Track theme mode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Rental App"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'support') {
                _showSupportDialog();
              } else if (value == 'settings') {
                _showSettingsDialog();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'support', child: Text("Customer Support")),
              PopupMenuItem(value: 'settings', child: Text("Settings")),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Signed in as: guest@example.com"), // Placeholder email
            SizedBox(height: 20),
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/default_avatar.png'), // Placeholder image
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Sign-out disabled for now")),
                );
              },
              child: Text("Sign Out (Disabled)"),
            ),
          ],
        ),
      ),
    );
  }

  // Show support email dialog
  void _showSupportDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Customer Support"),
        content: Text("Email: abhinavelavanz2023@gmail.com"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("OK")),
        ],
      ),
    );
  }

  // Show settings dialog (Light/Dark mode toggle)
  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Settings"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("App Theme"),
            SwitchListTile(
              title: Text(isDarkMode ? "Dark Mode" : "Light Mode"),
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
                Navigator.pop(context); // Close dialog
              },
            ),
          ],
        ),
      ),
    );
  }
}
