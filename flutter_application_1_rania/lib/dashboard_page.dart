import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> salesData = [
    {
      'noFaktur': '001',
      'tanggal': '2024-10-20',
      'customer': 'Kim Taehyung',
      'jumlahBarang': 5,
      'total': 500000,
    },
    {
      'noFaktur': '002',
      'tanggal': '2024-10-21',
      'customer': 'Jeon Jungkook',
      'jumlahBarang': 3,
      'total': 300000,
    },
    {
      'noFaktur': '003',
      'tanggal': '2024-10-22',
      'customer': 'Park Jimin',
      'jumlahBarang': 7,
      'total': 700000,
    },
    {
      'noFaktur': '004',
      'tanggal': '2024-10-23',
      'customer': 'Kim Seokjin',
      'jumlahBarang': 5,
      'total': 500000,
    },
    {
      'noFaktur': '005',
      'tanggal': '2024-10-24',
      'customer': 'Min Yoongi',
      'jumlahBarang': 5,
      'total': 500000,
    },
    {
      'noFaktur': '006',
      'tanggal': '2024-10-25',
      'customer': 'Jung Heosok',
      'jumlahBarang': 6,
      'total': 600000,
    },
    {
      'noFaktur': '007',
      'tanggal': '2024-10-26',
      'customer': 'Kim Namjoon',
      'jumlahBarang': 6,
      'total': 600000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: ListView.builder(
        itemCount: salesData.length,
        itemBuilder: (context, index) {
          final sale = salesData[index];
          return ListTile(
            title: Text('Faktur: ${sale['noFaktur']}'),
            subtitle: Text('Tanggal: ${sale['tanggal']}, Customer: ${sale['customer']}'),
            trailing: Text('Total: ${sale['total']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SaleDetailPage(sale: sale),
                ),
              );
            },
          );
        },
      ),
      // Back button to Home
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}

class SaleDetailPage extends StatelessWidget {
  final Map<String, dynamic> sale;

  SaleDetailPage({required this.sale});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Faktur ${sale['noFaktur']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Faktur: ${sale['noFaktur']}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Tanggal: ${sale['tanggal']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Customer: ${sale['customer']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Jumlah Barang: ${sale['jumlahBarang']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Total: ${sale['total']}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
