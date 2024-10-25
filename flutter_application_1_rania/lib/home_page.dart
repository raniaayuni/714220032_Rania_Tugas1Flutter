import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'add_page.dart';
import 'update_page.dart';
import 'login_page.dart'; // Change this if you have a LogoutPage defined

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Management System'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: <Widget>[
            MenuItem(
              icon: Icons.dashboard,
              label: 'Dashboard',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
            ),
            MenuItem(
              icon: Icons.add,
              label: 'Add',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPage()),
                );
              },
            ),
            MenuItem(
              icon: Icons.update,
              label: 'Update',
              onTap: () {
                // Ensure to pass necessary parameters if UpdatePage requires them
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdatePage(
                      itemName: 'Existing Item', // Replace with actual data
                      itemPrice: 100.0, // Replace with actual data
                    ),
                  ),
                );
              },
            ),
            MenuItem(
              icon: Icons.logout,
              label: 'Logout',
              onTap: () {
                // Assuming LogoutPage is not defined, navigate to LoginPage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onTap;

  MenuItem({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 50,
            ),
            SizedBox(height: 16),
            Text(label),
          ],
        ),
      ),
    );
  }
}
