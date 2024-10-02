# Food Wasted App

A Flutter application dedicated to reducing food waste by managing your household food items, tracking expiration dates, and providing personalized recipe suggestions.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Screenshots](#screenshots)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
  - [Home Screen](#home-screen)
  - [Scanning Items](#scanning-items)
  - [Viewing Inventory](#viewing-inventory)
  - [Profile Management](#profile-management)
  - [Recipe Suggestions](#recipe-suggestions)
- [Project Structure](#project-structure)
- [Code Highlights](#code-highlights)
- [Technologies Used](#technologies-used)
- [Future Enhancements](#future-enhancements)
- [Contributing](#contributing)
- [License](#license)
- [Contact Information](#contact-information)

---

## Overview

**Food Wasted App** is a mobile application built with Dart and Flutter aimed at helping users:

- Keep track of food items in their refrigerator or pantry.
- Monitor expiration dates to reduce food waste.
- Access nutritional information such as proteins, calories, and other nutrients.
- Scan products using a barcode scanner integrated with an API.
- Receive personalized recipe suggestions based on ingredients nearing expiration, dietary preferences, allergies, and desired calorie intake.

*Note: The app is currently under development. The front-end and barcode scanner functionalities are implemented, while Firebase integration and AI-powered recipe suggestions are planned features.*

---

## Features

- **Inventory Management**: Easily add and manage food items in your inventory.
- **Expiration Tracking**: Automatically sort items by expiration date and receive notifications.
- **Barcode Scanning**: Quickly add products by scanning barcodes using an integrated API.
- **Nutritional Information**: View detailed nutritional facts for each product.
- **Personalized Recipes**: (Upcoming) Get AI-generated recipes based on your inventory and preferences.
- **User Profiles**: Customize your dietary preferences, allergies, and calorie goals.
- **Firebase Integration**: (Upcoming) Sync data across devices and secure user authentication.

---

## Screenshots

- **Login and Register**
![image](https://github.com/user-attachments/assets/f5ea40ee-d111-4855-9d92-78dc80a50513)
![image](https://github.com/user-attachments/assets/36aab6a3-1b4c-4f99-af51-96063778d307)
![image](https://github.com/user-attachments/assets/98d3e06b-63fd-496d-8a05-e9be76a4a520)



- **Home Screen**

 ![image](https://github.com/user-attachments/assets/b3869c89-1515-4515-bddd-cdd182f04b49)

- **My Profile**

![image](https://github.com/user-attachments/assets/dd8086e3-2d88-4e74-984c-97143c16e33c)

  
- **Food in Refrigerator**

  ![image](https://github.com/user-attachments/assets/c1b63bc0-2ad0-4f70-8a2d-5615e0c26475)


- **Scan Item**

  ![image](https://github.com/user-attachments/assets/56df185c-aadb-4fa7-95ad-2c2b7f855fbd)
  ![image](https://github.com/user-attachments/assets/42170e1d-c4db-419e-b240-847a292db704)


- **Recipe Suggestions**

  ![image](https://github.com/user-attachments/assets/b2c72221-744c-4011-b6c9-ef6fc5ec11bd)


---

## Getting Started

### Prerequisites

- **Flutter SDK**: Version 2.0 or higher.
- **Dart SDK**: Comes bundled with Flutter.
- **Development IDE**: VSCode, Android Studio, or any preferred IDE.
- **Device or Emulator**: Android or iOS device/emulator for testing.

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/food-wasted-app.git
   cd food-wasted-app
   ```

2. **Install Dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the App**

   ```bash
   flutter run
   ```

---

## Usage

### Home Screen

The home screen provides quick access to all major features:

- **My Profile**: View and edit your dietary preferences.
- **Scan Item**: Launch the barcode scanner to add new items.
- **Food in Refrigerator**: View and manage your current inventory.
- **Design Recipe**: Access personalized recipe suggestions.

### Scanning Items

- Tap on **Scan Item** from the home screen.
- Grant camera permissions if prompted.
- Align the barcode within the frame to automatically scan.
- If the product is found, its details will be displayed.
- Add the item to your inventory and set an expiration date.

### Viewing Inventory

- Select **Food in Refrigerator** from the home screen.
- View a list of all items sorted by expiration date.
- Tap on an item to view details or remove it from the list.

### Profile Management

- Navigate to **My Profile** to update your information.
- Edit your cooking style, diet type, allergies, and calorie goals.
- This information will be used to tailor recipe suggestions.

### Recipe Suggestions

- Choose **Design Recipe** to see recipes based on your inventory.
- Recipes will prioritize ingredients nearing expiration.
- Filters include dietary preferences and calorie limits.

---

## Project Structure

- **lib/**: Main application source code.
  - **services/**: Contains API service classes.
    - `food_service.dart`: Handles fetching product data from the API.
  - **views/**: UI components and screens.
    - `home.dart`: Main home screen.
    - `scan_barcode.dart`: Barcode scanning functionality.
    - `product_detail.dart`: Displays product information.
    - `full_product_detail.dart`: Shows detailed nutritional info.
    - `food_in_refrigerator.dart`: Inventory management screen.
    - `my_profile.dart`: User profile screen.
    - `recipie.dart`: Recipe suggestions screen.
    - `login.dart` & `register1.dart`: Authentication screens.
- **assets/**: Images and other static assets.
- **pubspec.yaml**: Project configurations and dependencies.

---

## Code Highlights

### 1. Fetching Product Data from API

```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class FoodService {
  static const String _baseUrl = 'https://world.openfoodfacts.org/api/v0/product/';

  Future<Map<String, dynamic>?> fetchProduct(String barcode) async {
    final response = await http.get(Uri.parse('$_baseUrl$barcode.json'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}
```

### 2. Displaying Inventory Items

```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FoodInRefrigeratorPage extends StatefulWidget {
  // ...

  @override
  Widget build(BuildContext context) {
    _fridgeItems.sort((a, b) {
      DateTime expiryA = DateFormat('yyyy-MM-dd').parse(a['expiryDate']);
      DateTime expiryB = DateFormat('yyyy-MM-dd').parse(b['expiryDate']);
      return expiryA.compareTo(expiryB);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('What\'s in your fridge?'),
        backgroundColor: Colors.green[700],
      ),
      body: ListView.builder(
        itemCount: _fridgeItems.length,
        itemBuilder: (context, index) {
          final item = _fridgeItems[index];
          // Item widget code...
        },
      ),
    );
  }
}
```

### 3. Barcode Scanning Functionality

```dart
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanBarcodePage extends StatelessWidget {
  Future<void> scanBarcode(BuildContext context) async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE);

    if (barcodeScanRes != '-1') {
      // Fetch product data and navigate to ProductDetailPage
    } else {
      // Handle cancellation
    }
  }

  @override
  Widget build(BuildContext context) {
    // UI code...
  }
}
```

---

## Technologies Used

- **Dart & Flutter**: Core language and framework for app development.
- **Open Food Facts API**: To retrieve product and nutritional information.
- **Firebase**: (Planned) For backend services like authentication and database.
- **Flutter Barcode Scanner**: For scanning product barcodes.
- **Charts Flutter**: To display nutritional information graphically.
- **Intl Package**: For date formatting and localization.

---

## Future Enhancements

- **Firebase Integration**: Implement user authentication and real-time database.
- **AI-Powered Recipes**: Integrate with ChatGPT or similar AI for advanced recipe suggestions.
- **Push Notifications**: Alert users about expiring items.
- **Shopping List Feature**: Generate shopping lists based on recipes or low-stock items.
- **Multi-Language Support**: Make the app accessible to a wider audience.
- **Dark Mode**: Provide a dark theme option for users.

---

## Contributing

Contributions are welcome! To contribute:

1. **Fork the repository**.
2. **Create a new branch** for your feature or bug fix.

   ```bash
   git checkout -b feature/awesome-feature
   ```

3. **Commit your changes** with clear messages.

   ```bash
   git commit -m "Add awesome feature"
   ```

4. **Push to your fork**.

   ```bash
   git push origin feature/awesome-feature
   ```

5. **Submit a pull request** detailing your changes.

---

## Contact Information

- **Developer**: Pablo Simon Estrada
- **Email**: pablosies96@gmail.com 
- **LinkedIn**: [[linkedin.com/in/yourprofile](https://www.linkedin.com/in/yourprofile)](https://www.linkedin.com/in/pablo-simon-a2236a213/)

---
