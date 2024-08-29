import 'package:flutter/material.dart';
import 'package:food_wasted_app/views/product_detail.dart';
import 'package:intl/intl.dart';

class FoodInRefrigeratorPage extends StatefulWidget {
  const FoodInRefrigeratorPage({super.key});

  @override
  State<FoodInRefrigeratorPage> createState() => _FoodInRefrigeratorPageState();
}

class _FoodInRefrigeratorPageState extends State<FoodInRefrigeratorPage> {
  final List<Map<String, dynamic>> _fridgeItems = [
    {'name': 'Milk', 'quantity': '1L', 'expiryDate': '2024-04-20'},
    {'name': 'Eggs', 'quantity': '12 units', 'expiryDate': '2024-04-15'},
    {'name': 'Cheese', 'quantity': '500g', 'expiryDate': '2024-04-30'},
    {'name': 'Yogurt', 'quantity': '4 units', 'expiryDate': '2024-04-25'},
    {'name': 'Vegetables', 'quantity': 'Assorted', 'expiryDate': '2024-04-18'},
  ];

  void _removeItem(int index) {
    setState(() {
      _fridgeItems.removeAt(index);
    });
  }

  void _consumeItem(int index) {
    setState(() {
      _fridgeItems[index]['consumed'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    _fridgeItems.sort((a, b) {
      DateTime expiryA = DateFormat('yyyy-MM-dd').parse(a['expiryDate']);
      DateTime expiryB = DateFormat('yyyy-MM-dd').parse(b['expiryDate']);
      return expiryA.compareTo(expiryB);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'What\'s in your fridge?',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[700],
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.green[50]!, Colors.green[300]!],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: _fridgeItems.length,
                    separatorBuilder: (context, index) => const Divider(color: Colors.transparent),
                    itemBuilder: (context, index) {
                      final item = _fridgeItems[index];
                      final expiryDate = DateFormat('yyyy-MM-dd').parse(item['expiryDate']);
                      final daysUntilExpiry = expiryDate.difference(DateTime.now()).inDays;

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
                            child: const Icon(Icons.kitchen, color: Colors.white),
                          ),
                          title: Text(
                            item['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[800],
                              decoration: item.containsKey('consumed') && item['consumed']
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          subtitle: Text(
                            'Quantity: ${item['quantity']}\nExpiry in $daysUntilExpiry days',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.blueGrey[600],
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _removeItem(index),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailPage(
                                  productData: {
                                    'product': {
                                      'product_name_en': item['name'],
                                      'expiration_date': item['expiryDate'],
                                    },
                                    'expiryDate': item['expiryDate'],
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
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
