import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductAddPage extends StatefulWidget {
  @override
  _ProductAddPageState createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _addProduct() async {
    final String productName = _productNameController.text.trim();
    final String description = _descriptionController.text.trim();

    final String url = 'http://127.0.0.1:8000/api/add_product';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'product_name': productName,
        'description': description,
      },
    );

    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      // Product added successfully
      print('Product added successfully');
    } else {
      // Failed to add product
      print('Failed to add product');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 12.0),
            TextField(
              controller: _productNameController,
              decoration: InputDecoration(labelText: 'Product name'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _addProduct,
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
