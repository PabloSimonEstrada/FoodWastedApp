import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanBarcodePage extends StatelessWidget {
  const ScanBarcodePage({Key? key}) : super(key: key);

  Future<void> scanBarcode(BuildContext context) async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE
    );

    if (barcodeScanRes == '-1') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Scanning cancelled')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Scanned code: $barcodeScanRes')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Barcode'),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt,
                  size: 100,
                  color: Colors.lightGreen,
                ),
                SizedBox(height: 20),
                Text(
                  'Point your camera at a barcode',
                  style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.lightGreen),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Align the barcode within the frame to scan',
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => scanBarcode(context),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.lightGreen,
                    padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    'Start Scanning',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
