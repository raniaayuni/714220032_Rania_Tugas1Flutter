import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  String? _itemName;
  double? _itemPrice;

  void _addData() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Here you can add the logic to save the data to your database or wherever needed
      // For example, you might call a method to add the item to a list or send it to a backend service.
      print('Item Name: $_itemName, Item Price: $_itemPrice');
      // Navigate back after saving
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Sales Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Item Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter item name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _itemName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Item Price'),
                keyboardType: TextInputType.number,
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
                  _itemPrice = double.tryParse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addData,
                child: Text('Add Data'),
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
