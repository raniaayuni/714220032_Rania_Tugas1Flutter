import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  final String itemName; // Existing item name to update
  final double itemPrice; // Existing item price to update

  UpdatePage({required this.itemName, required this.itemPrice});

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final _formKey = GlobalKey<FormState>();
  late String _itemName;
  late double _itemPrice;

  @override
  void initState() {
    super.initState();
    // Initialize with existing data
    _itemName = widget.itemName;
    _itemPrice = widget.itemPrice;
  }

  void _updateData() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Here you can add the logic to update the data in your database or wherever needed
      // For example, you might call a method to update the item in a list or send it to a backend service.
      print('Updated Item Name: $_itemName, Updated Item Price: $_itemPrice');
      // Navigate back after updating
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Sales Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _itemName, // Populate with existing name
                decoration: InputDecoration(labelText: 'Item Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter item name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _itemName = value!;
                },
              ),
              TextFormField(
                initialValue: _itemPrice.toString(), // Populate with existing price
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Item Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter item price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _itemPrice = double.tryParse(value!)!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateData,
                child: Text('Update Data'),
              ),
            ],
          ),
        ),
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
