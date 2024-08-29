import 'package:flutter/material.dart';
import 'package:food_wasted_app/views/home.dart';
import 'package:food_wasted_app/views/login.dart';
import 'package:food_wasted_app/views/register1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Waste Reduction App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.lightGreen,
          accentColor: Colors.amber,
        ),
        scaffoldBackgroundColor: Colors.grey.shade100,
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'OpenSans'),
        ),
      ),
      home: const LogoScreen(),
      routes: {
        '/home/': (context) => const HomePage(),
        '/login/': (context) => const LoginPage(),
        '/register/': (context) => const CreateAccountPage(),
      },
    );
  }
}

class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Container(

              child: Image.asset('assets/images/fw.png', width: 250, height: 250),
            ),

            const Text(
              'Welcome to Food Waste App!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'OpenSans'),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                'Join the movement,\nReduce food waste.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, fontFamily: 'OpenSans'),
              ),
            ),
            _buildActionButton(
              context: context,
              title: 'Login',
              color: Colors.lightGreen,
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage())),
            ),
            _buildActionButton(
              context: context,
              title: 'Register',
              isOutlined: true,
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateAccountPage())),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {

              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
              ),
              child: const Text('Or sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({required BuildContext context, required String title, bool isOutlined = false, required VoidCallback onPressed, Color? color}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      width: double.infinity,
      child: isOutlined
          ? OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color ?? Colors.lightGreen),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Text(title, style: const TextStyle(fontSize: 18, fontFamily: 'OpenSans')),
      )
          : ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.lightGreen,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Text(title, style: const TextStyle(fontSize: 18, fontFamily: 'OpenSans', color: Colors.white)),
      ),

    );
  }
}
