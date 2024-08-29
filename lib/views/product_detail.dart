import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:food_wasted_app/views/full_product_detail.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> productData;

  const ProductDetailPage({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    final product = productData['product'];
    final selectedExpirationDate = productData['expiryDate'];
    final expirationDate = selectedExpirationDate != null
        ? DateFormat('dd MMM yyyy').format(DateTime.parse(selectedExpirationDate))
        : (product['expiration_date'] ?? 'N/A');
    final productName = product['product_name_en'] ?? 'N/A';
    final productImage = product['image_url'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightGreen,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.green[50]!, Colors.green[300]!],
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (productImage.isNotEmpty)
                Center(
                  child: Image.network(productImage, height: 200, fit: BoxFit.contain),
                ),
              const SizedBox(height: 16),
              Text(
                'Product Name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey[800]),
              ),
              const SizedBox(height: 8),
              Text(
                productName,
                style: TextStyle(fontSize: 18, color: Colors.blueGrey[700]),
              ),
              const SizedBox(height: 16),
              Text(
                'Expiration Date',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey[800]),
              ),
              const SizedBox(height: 8),
              Text(
                expirationDate,
                style: TextStyle(fontSize: 18, color: Colors.blueGrey[700]),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Add', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      // Lógica para añadir el producto
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.details),
                    label: const Text('Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullProductDetailPage(productData: product),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
