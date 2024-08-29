import 'package:flutter/material.dart';
import 'package:food_wasted_app/views/home.dart';
import 'package:food_wasted_app/views/register1.dart';
import 'register1.dart';  // Asegúrate de importar la página de registro

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);  // Regresa a la pantalla anterior
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              // Logo
              Image.asset(
                'assets/images/fw.png', // Asegúrate de que la ruta del logo sea correcta
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 10),
              // Header text
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter your email and password to continue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Email TextField
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20),
              // Password TextField
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              // Sign In Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,  // Texto blanco para que sea visible
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Forgot Password & Register Links
              TextButton(
                onPressed: () {
                  // Navegar a "Forgot Password"
                },
                child: const Text('Forgot Password?', style: TextStyle(color: Colors.lightGreen)),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?", style: TextStyle(color: Colors.black54)),
                  TextButton(
                    onPressed: () {
                      // Navegar a la pantalla de registro
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CreateAccountPage()),
                      );
                    },
                    child: const Text('Sign Up', style: TextStyle(color: Colors.lightGreen)),
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
