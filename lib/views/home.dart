import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_wasted_app/views/food_in_refrigerator.dart';
import 'package:food_wasted_app/views/my_profile.dart';
import 'package:food_wasted_app/views/scan_barcode.dart';
import 'Recipie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Locking the device orientation to portrait mode.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Zero Waste',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.green[50]!, Colors.green[300]!],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/images/fw.png',
                    width: 220,
                    height: 220,
                  ),
                ),
              ),
              Text(
                'Join the movement to reduce food waste!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[800],
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: ActionButton(
                          title: 'My Profile',
                          icon: Icons.person,
                          color: Colors.teal,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MyProfilePage()),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: ActionButton(
                          title: 'Scan Item',
                          icon: Icons.camera_alt,
                          color: Colors.orangeAccent,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ScanBarcodePage()),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: ActionButton(
                          title: 'Food in Refrigerator',
                          icon: Icons.kitchen,
                          color: Colors.purpleAccent,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const FoodInRefrigeratorPage()),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: ActionButton(
                          title: 'Design Recipe',
                          icon: Icons.book,
                          color: Colors.redAccent,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DesignRecipePage()),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color == Colors.white ? Colors.white : color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: color == Colors.white
              ? BorderSide(color: Theme.of(context).primaryColor, width: 2)
              : BorderSide.none,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 18),
        elevation: 4,
      ),
    );
  }
}
