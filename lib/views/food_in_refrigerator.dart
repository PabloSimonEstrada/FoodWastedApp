import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    _fridgeItems.sort((a, b) {
      DateTime expiryA = DateFormat('yyyy-MM-dd').parse(a['expiryDate']);
      DateTime expiryB = DateFormat('yyyy-MM-dd').parse(b['expiryDate']);
      return expiryA.compareTo(expiryB);
    });

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
          child: Padding(

            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                  child: Text(
                    'What\'s in your fridge?',
                    style: TextStyle(
                      color: Colors.blueGrey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
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
                            child: Icon(Icons.kitchen, color: Colors.white),
                          ),
                          title: Text(
                            item['name'],
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey[800]),
                          ),
                          subtitle: Text(
                            'Quantity: ${item['quantity']}\nExpiry in $daysUntilExpiry days',
                            style: TextStyle(fontSize: 15, color: Colors.blueGrey[600]),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor),
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
