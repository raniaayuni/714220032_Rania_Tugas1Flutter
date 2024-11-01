import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'add_page.dart';
import 'update_page.dart';
import 'login_page.dart';
import 'produk_page.dart';
import 'produk_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),  // Start from Login Page
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Management System'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Row for the first two menu buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MenuButton(
                icon: Icons.dashboard,
                label: 'Dashboard',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage()),
                  );
                },
              ),
              MenuButton(
                icon: Icons.add,
                label: 'Add',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPage()),
                  );
                },
              ),
            ],
          ),
          // Row for the next two menu buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MenuButton(
                icon: Icons.update,
                label: 'Update',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdatePage(
                        itemName: 'Existing Item', // Replace with actual item name
                        itemPrice: 100.0, // Replace with actual item price
                      ),
                    ),
                  );
                },
              ),
              MenuButton(
                icon: Icons.logout,
                label: 'Logout',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
          // Adding button for Products page
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MenuButton(
                icon: Icons.shopping_cart,
                label: 'Products',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProdukPage()),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          // Student information
          Text('NPM: 714220032'),
          Text('Name: Rania Ayuni Kartini Fitri'),
        ],
      ),
    );
  }
}

// Custom widget for buttons
class MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  MenuButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            Icon(icon, size: 50),
            Text(label),
          ],
        ),
      ),
    );
  }
}
