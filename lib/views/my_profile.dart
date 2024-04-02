import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage('https://via.placeholder.com/160'),
                ),
                const SizedBox(height: 30),
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.lightGreen, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const ProfileInfoCard(
                  icon: Icons.restaurant_menu,
                  title: 'Cooking Style',
                  subtitle: 'Gourmet',
                ),
                const ProfileInfoCard(
                  icon: Icons.local_florist,
                  title: 'Diet Type',
                  subtitle: 'Vegetarian',
                ),
                const ProfileInfoCard(
                  icon: Icons.warning,
                  title: 'Allergies',
                  subtitle: 'Peanuts',
                ),
                const ProfileInfoCard(
                  icon: Icons.local_fire_department,
                  title: 'Calories Consumption',
                  subtitle: '2500/day',
                ),
                const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.lightGreen,
                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text(
                'Edit Profile',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ), ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfileInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, color: Colors.lightGreen),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
