import 'package:flutter/material.dart';

class DesignRecipePage extends StatelessWidget {
  const DesignRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Recipe> recipes = [
      Recipe(
        name: 'Zesty Lime Fish Tacos',
        ingredientsInFridge: ['Cod', 'Lime'],
        ingredientsToBuy: ['Avocado', 'Tortillas', 'Cilantro'],
        calories: 300,
        cuisine: 'Mexican',
        healthRating: '⭐⭐⭐⭐',
      ),
      Recipe(
        name: 'Spicy Chickpea Curry',
        ingredientsInFridge: ['Chickpeas', 'Tomato Paste'],
        ingredientsToBuy: ['Coconut Milk', 'Curry Leaves'],
        calories: 450,
        cuisine: 'Indian',
        healthRating: '⭐⭐⭐⭐⭐',
      ),
      Recipe(
        name: 'Mediterranean Quinoa Salad',
        ingredientsInFridge: ['Quinoa', 'Cucumber'],
        ingredientsToBuy: ['Feta Cheese', 'Olives'],
        calories: 350,
        cuisine: 'Mediterranean',
        healthRating: '⭐⭐⭐⭐⭐',
      ),
    ];

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
          child: ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (BuildContext context, int index) {
              return RecipeCard(recipe: recipes[index]);
            },
          ),
        ),
      ),
    );
  }
}

class Recipe {
  final String name;
  final List<String> ingredientsInFridge;
  final List<String> ingredientsToBuy;
  final int calories;
  final String cuisine;
  final String healthRating;

  Recipe({
    required this.name,
    required this.ingredientsInFridge,
    required this.ingredientsToBuy,
    required this.calories,
    required this.cuisine,
    required this.healthRating,
  });
}

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold); // Estilo para los títulos
    double lineSpacing = 4.0; // Espacio entre líneas para mejor legibilidad

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: lineSpacing),
              child: Text(
                recipe.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Divider(color: Theme.of(context).primaryColor),
            Text(
              'Ingredients in your fridge: ',
              style: titleStyle,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: lineSpacing),
              child: Text(recipe.ingredientsInFridge.join(', ')),
            ),
            Text(
              'Ingredients to buy: ',
              style: titleStyle,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: lineSpacing),
              child: Text(recipe.ingredientsToBuy.join(', ')),
            ),
            Text(
              'Calories: ',
              style: titleStyle,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: lineSpacing),
              child: Text('${recipe.calories}'),
            ),
            Text(
              'Cuisine: ',
              style: titleStyle,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: lineSpacing),
              child: Text(recipe.cuisine),
            ),
            Text(
              'Health Rating:',
              style: titleStyle,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: lineSpacing),
              child: Text(
                recipe.healthRating,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                ),
                child: const Text('View Recipe'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
