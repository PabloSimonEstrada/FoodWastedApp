import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FullProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> productData;

  const FullProductDetailPage({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productData['product_name_en'] ?? 'Product Detail',  style: const TextStyle(color: Colors.white)),
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
              Text(
                'Product Name: ${productData['product_name_en'] ?? 'N/A'}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey[800]),
              ),
              const SizedBox(height: 10),
              Text(
                'Ingredients: ${productData['ingredients_text_en'] ?? 'N/A'}',
                style: TextStyle(fontSize: 16, color: Colors.blueGrey[700]),
              ),
              const SizedBox(height: 20),
              Text(
                'Nutritional Information (per 100g):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey[800]),
              ),
              const SizedBox(height: 10),
              Text(
                'Energy: ${(productData['nutriments']['energy_100g'] ?? 'N/A')} kJ / ${_kJToKCal(productData['nutriments']['energy_100g'])} kcal',
                style: TextStyle(fontSize: 16, color: Colors.blueGrey[700]),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: charts.BarChart(
                  _createSampleData(),
                  animate: true,
                  vertical: false,
                ),
              ),
              const SizedBox(height: 10),
              _buildNutritionalInfo(),
            ],
          ),
        ),
      ),
    );
  }

  List<charts.Series<Nutrient, String>> _createSampleData() {
    final data = [
      Nutrient('Fat', (productData['nutriments']['fat_100g'] ?? 0).toDouble(), 'g'),
      Nutrient('Saturated Fat', (productData['nutriments']['saturated-fat_100g'] ?? 0).toDouble(), 'g'),
      Nutrient('Carbohydrates', (productData['nutriments']['carbohydrates_100g'] ?? 0).toDouble(), 'g'),
      Nutrient('Sugars', (productData['nutriments']['sugars_100g'] ?? 0).toDouble(), 'g'),
      Nutrient('Fiber', (productData['nutriments']['fiber_100g'] ?? 0).toDouble(), 'g'),
      Nutrient('Proteins', (productData['nutriments']['proteins_100g'] ?? 0).toDouble(), 'g'),
      Nutrient('Salt', (productData['nutriments']['salt_100g'] ?? 0).toDouble(), 'g'),
    ];

    return [
      charts.Series<Nutrient, String>(
        id: 'Nutrients',
        domainFn: (Nutrient nutrient, _) => nutrient.name,
        measureFn: (Nutrient nutrient, _) => nutrient.value,
        data: data,
      ),
    ];
  }

  Widget _buildNutritionalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildNutrientInfoRow('Fat', productData['nutriments']['fat_100g'], 'g'),
        _buildNutrientInfoRow('Saturated Fat', productData['nutriments']['saturated-fat_100g'], 'g'),
        _buildNutrientInfoRow('Carbohydrates', productData['nutriments']['carbohydrates_100g'], 'g'),
        _buildNutrientInfoRow('Sugars', productData['nutriments']['sugars_100g'], 'g'),
        _buildNutrientInfoRow('Fiber', productData['nutriments']['fiber_100g'], 'g'),
        _buildNutrientInfoRow('Proteins', productData['nutriments']['proteins_100g'], 'g'),
        _buildNutrientInfoRow('Salt', productData['nutriments']['salt_100g'], 'g'),
      ],
    );
  }

  Widget _buildNutrientInfoRow(String nutrient, dynamic value, String unit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        '$nutrient: ${value ?? 'N/A'} $unit',
        style: TextStyle(fontSize: 16, color: Colors.blueGrey[700]),
      ),
    );
  }

  double _kJToKCal(dynamic kJ) {
    if (kJ == null) return 0.0;
    return (kJ / 4.184).roundToDouble();
  }
}

class Nutrient {
  final String name;
  final double value;
  final String unit;

  Nutrient(this.name, this.value, this.unit);
}
