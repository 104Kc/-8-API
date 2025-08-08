import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: const RecipesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Recipe {
  final int id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String difficulty;
  final String cuisine;
  final int caloriesPerServing;
  final List<String> tags;
  final int userId;
  final String image;
  final double rating;
  final int reviewCount;
  final List<String> mealType;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
      prepTimeMinutes: json['prepTimeMinutes'],
      cookTimeMinutes: json['cookTimeMinutes'],
      servings: json['servings'],
      difficulty: json['difficulty'],
      cuisine: json['cuisine'],
      caloriesPerServing: json['caloriesPerServing'],
      tags: List<String>.from(json['tags']),
      userId: json['userId'],
      image: json['image'],
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      mealType: List<String>.from(json['mealType']),
    );
  }
}

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  // ข้อมูล JSON ตรงนี้ (Local data)
  final Map<String, dynamic> jsonData = const {
    "recipes": [
      {
        "id": 1,
        "name": "Classic Margherita Pizza",
        "ingredients": [
          "Pizza dough",
          "Tomato sauce",
          "Fresh mozzarella cheese",
          "Fresh basil leaves",
          "Olive oil",
          "Salt and pepper to taste"
        ],
        "instructions": [
          "Preheat the oven to 475°F (245°C).",
          "Roll out the pizza dough and spread tomato sauce evenly.",
          "Top with slices of fresh mozzarella and fresh basil leaves.",
          "Drizzle with olive oil and season with salt and pepper.",
          "Bake in the preheated oven for 12-15 minutes or until the crust is golden brown.",
          "Slice and serve hot."
        ],
        "prepTimeMinutes": 20,
        "cookTimeMinutes": 15,
        "servings": 4,
        "difficulty": "Easy",
        "cuisine": "Italian",
        "caloriesPerServing": 300,
        "tags": ["Pizza", "Italian"],
        "userId": 166,
        "image": "https://cdn.dummyjson.com/recipe-images/1.webp",
        "rating": 4.6,
        "reviewCount": 98,
        "mealType": ["Dinner"]
      },
      {
      "id": 2,
      "name": "Vegetarian Stir-Fry",
      "ingredients": [
        "Tofu, cubed",
        "Broccoli florets",
        "Carrots, sliced",
        "Bell peppers, sliced",
        "Soy sauce",
        "Ginger, minced",
        "Garlic, minced",
        "Sesame oil",
        "Cooked rice for serving"
      ],
      "instructions": [
        "In a wok, heat sesame oil over medium-high heat.",
        "Add minced ginger and garlic, sauté until fragrant.",
        "Add cubed tofu and stir-fry until golden brown.",
        "Add broccoli, carrots, and bell peppers. Cook until vegetables are tender-crisp.",
        "Pour soy sauce over the stir-fry and toss to combine.",
        "Serve over cooked rice."
      ],
      "prepTimeMinutes": 15,
      "cookTimeMinutes": 20,
      "servings": 3,
      "difficulty": "Medium",
      "cuisine": "Asian",
      "caloriesPerServing": 250,
      "tags": [
        "Vegetarian",
        "Stir-fry",
        "Asian"
      ],
      "userId": 143,
      "image": "https://cdn.dummyjson.com/recipe-images/2.webp",
      "rating": 4.7,
      "reviewCount": 26,
      "mealType": [
        "Lunch"
      ]
    },
    {
      "id": 3,
      "name": "Chocolate Chip Cookies",
      "ingredients": [
        "All-purpose flour",
        "Butter, softened",
        "Brown sugar",
        "White sugar",
        "Eggs",
        "Vanilla extract",
        "Baking soda",
        "Salt",
        "Chocolate chips"
      ],
      "instructions": [
        "Preheat the oven to 350°F (175°C).",
        "In a bowl, cream together softened butter, brown sugar, and white sugar.",
        "Beat in eggs one at a time, then stir in vanilla extract.",
        "Combine flour, baking soda, and salt. Gradually add to the wet ingredients.",
        "Fold in chocolate chips.",
        "Drop rounded tablespoons of dough onto ungreased baking sheets.",
        "Bake for 10-12 minutes or until edges are golden brown.",
        "Allow cookies to cool on the baking sheet for a few minutes before transferring to a wire rack."
      ],
      "prepTimeMinutes": 15,
      "cookTimeMinutes": 10,
      "servings": 24,
      "difficulty": "Easy",
      "cuisine": "American",
      "caloriesPerServing": 150,
      "tags": [
        "Cookies",
        "Dessert",
        "Baking"
      ],
      "userId": 34,
      "image": "https://cdn.dummyjson.com/recipe-images/3.webp",
      "rating": 4.9,
      "reviewCount": 13,
      "mealType": [
        "Snack",
        "Dessert"
      ]
    },
    {
      "id": 6,
      "name": "Quinoa Salad with Avocado",
      "ingredients": [
        "Quinoa, cooked",
        "Avocado, diced",
        "Cherry tomatoes, halved",
        "Cucumber, diced",
        "Red bell pepper, diced",
        "Feta cheese, crumbled",
        "Lemon vinaigrette dressing",
        "Salt and pepper to taste"
      ],
      "instructions": [
        "In a large bowl, combine cooked quinoa, diced avocado, halved cherry tomatoes, diced cucumber, diced red bell pepper, and crumbled feta cheese.",
        "Drizzle with lemon vinaigrette dressing and toss to combine.",
        "Season with salt and pepper to taste.",
        "Chill in the refrigerator before serving."
      ],
      "prepTimeMinutes": 20,
      "cookTimeMinutes": 15,
      "servings": 4,
      "difficulty": "Easy",
      "cuisine": "Mediterranean",
      "caloriesPerServing": 280,
      "tags": [
        "Salad",
        "Quinoa"
      ],
      "userId": 197,
      "image": "https://cdn.dummyjson.com/recipe-images/6.webp",
      "rating": 4.4,
      "reviewCount": 59,
      "mealType": [
        "Lunch",
        "Side Dish"
      ]
    },
    {
      "id": 7,
      "name": "Tomato Basil Bruschetta",
      "ingredients": [
        "Baguette, sliced",
        "Tomatoes, diced",
        "Fresh basil, chopped",
        "Garlic cloves, minced",
        "Balsamic glaze",
        "Olive oil",
        "Salt and pepper to taste"
      ],
      "instructions": [
        "Preheat the oven to 375°F (190°C).",
        "Place baguette slices on a baking sheet and toast in the oven until golden brown.",
        "In a bowl, combine diced tomatoes, chopped fresh basil, minced garlic, and a drizzle of olive oil.",
        "Season with salt and pepper to taste.",
        "Top each toasted baguette slice with the tomato-basil mixture.",
        "Drizzle with balsamic glaze before serving."
      ],
      "prepTimeMinutes": 15,
      "cookTimeMinutes": 10,
      "servings": 6,
      "difficulty": "Easy",
      "cuisine": "Italian",
      "caloriesPerServing": 120,
      "tags": [
        "Bruschetta",
        "Italian"
      ],
      "userId": 137,
      "image": "https://cdn.dummyjson.com/recipe-images/7.webp",
      "rating": 4.7,
      "reviewCount": 95,
      "mealType": [
        "Appetizer"
      ]
    },
    ]
  };

  @override
  Widget build(BuildContext context) {
    List<Recipe> recipes = (jsonData['recipes'] as List)
        .map((e) => Recipe.fromJson(e))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    recipe.image,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        height: 200,
                        child: const Icon(Icons.image_not_supported),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${recipe.cuisine} • ${recipe.difficulty}',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.timer, size: 16),
                          const SizedBox(width: 4),
                          Text(
                              'Prep: ${recipe.prepTimeMinutes} min | Cook: ${recipe.cookTimeMinutes} min'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '⭐ ${recipe.rating} (${recipe.reviewCount} reviews)',
                        style:
                            const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Ingredients: ${recipe.ingredients.join(', ')}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  RecipeDetailScreen(recipe: recipe),
                            ),
                          );
                        },
                        child: const Text('View Details'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Image.network(recipe.image,
                height: 200, fit: BoxFit.cover),
            const SizedBox(height: 12),
            Text(
              recipe.name,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Cuisine: ${recipe.cuisine}\nDifficulty: ${recipe.difficulty}\nServings: ${recipe.servings}\nCalories: ${recipe.caloriesPerServing}',
              style: const TextStyle(fontSize: 14),
            ),
            const Divider(height: 24),
            const Text(
              'Ingredients:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...recipe.ingredients.map((e) => Text('- $e')),
            const Divider(height: 24),
            const Text(
              'Instructions:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...recipe.instructions.asMap().entries.map(
                  (e) => Text('${e.key + 1}. ${e.value}'),
                ),
          ],
        ),
      ),
    );
  }
}
