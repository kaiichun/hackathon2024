import 'package:flutter/material.dart';
import 'package:hackathon_lintramax/screen/admin/main_page.dart';
import 'package:hackathon_lintramax/screen/admin/search_page.dart';
import 'package:hackathon_lintramax/screen/admin/settings.dart';

class AdminScreen extends StatefulWidget {
  @override
  _RootAdminPageState createState() => _RootAdminPageState();
}

class _RootAdminPageState extends State<AdminScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    AdminMainPage(),
    SearchEmployeePage(),
    SettingsPage()
  ];

  // Function to handle tap on the BottomNavigationBar
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Highlight the selected tab
        onTap: onTabTapped, // Handle tab changes
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
