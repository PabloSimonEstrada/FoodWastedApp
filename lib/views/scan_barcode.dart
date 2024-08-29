import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:food_wasted_app/services/food_service.dart';
import 'package:food_wasted_app/views/product_detail.dart';

class ScanBarcodePage extends StatelessWidget {
  const ScanBarcodePage({super.key});

  Future<void> scanBarcode(BuildContext context) async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE);

    if (barcodeScanRes == '-1') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Scanning cancelled')),
      );
    } else {
      FoodService foodService = FoodService();
      Map<String, dynamic>? productData =
      await foodService.fetchProduct(barcodeScanRes);

      if (productData != null && productData['status'] == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(productData: productData),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sorry, I can\'t find this product.')),
        );
      }
    }
  }

  void addProductManually(BuildContext context) {
    // Navegar a una página para añadir un producto manualmente
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add product manually tapped')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.green[50]!, Colors.green[300]!],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Icon(
                Icons.qr_code_scanner,
                size: 150,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 20),
              Text(
                'Scan a Barcode',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[800],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  'Align the barcode within the frame and the scanning will happen automatically.',
                  style: TextStyle(color: Colors.blueGrey[600], fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ElevatedButton(
                    onPressed: () => scanBarcode(context),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 18),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text(
                      'Start Scanning',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ElevatedButton(
                    onPressed: () => addProductManually(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Fondo blanco
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 18),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2),
                      ),
                    ),
                    child: Text(
                      'Add Product Manually',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor, // Texto verde
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
