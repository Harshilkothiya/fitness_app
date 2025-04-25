class Meal {
  final String name;
  final String type;
  final int calories;
  final String time;
  final List<String> ingredients;
  final String imagePath;
  final String description;

  Meal({
    required this.name,
    required this.type,
    required this.calories,
    required this.time,
    required this.ingredients,
    required this.imagePath,
    required this.description,
  });

  static List<Meal> breakfastMeals = [
    Meal(
      name: 'Oatmeal with Fruits',
      type: 'Breakfast',
      calories: 320,
      time: '7:00 AM',
      ingredients: ['1 cup oatmeal', '1 banana', '5 strawberries', 'Honey'],
      imagePath: 'assets/images/food/breakfast/oatmeal.jpg',
      description: 'Start your day with a healthy bowl of oatmeal',
    ),
    Meal(
      name: 'Protein Smoothie Bowl',
      type: 'Breakfast',
      calories: 280,
      time: '7:30 AM',
      ingredients: ['Greek yogurt', 'Mixed berries', 'Protein powder', 'Granola'],
      imagePath: 'assets/images/food/breakfast/smoothie.jpg',
      description: 'Power-packed smoothie bowl',
    ),
  ];

  static List<Meal> lunchMeals = [
    Meal(
      name: 'Grilled Chicken Salad',
      type: 'Lunch',
      calories: 450,
      time: '1:00 PM',
      ingredients: ['200g chicken breast', 'Mixed greens', 'Olive oil', 'Cherry tomatoes'],
      imagePath: 'assets/images/food/lunch/chicken_salad.jpg',
      description: 'High protein lunch option',
    ),
    Meal(
      name: 'Quinoa Buddha Bowl',
      type: 'Lunch',
      calories: 380,
      time: '12:30 PM',
      ingredients: ['Quinoa', 'Roasted chickpeas', 'Avocado', 'Tahini dressing'],
      imagePath: 'assets/images/food/lunch/buddha_bowl.jpg',
      description: 'Nutrient-rich vegetarian option',
    ),
  ];

  static List<Meal> dinnerMeals = [
    Meal(
      name: 'Salmon with Quinoa',
      type: 'Dinner',
      calories: 380,
      time: '7:00 PM',
      ingredients: ['200g salmon', '1 cup quinoa', 'Steamed vegetables', 'Lemon sauce'],
      imagePath: 'assets/images/food/dinner/salmon.jpg',
      description: 'Omega-3 rich dinner',
    ),
    Meal(
      name: 'Lean Steak with Sweet Potato',
      type: 'Dinner',
      calories: 420,
      time: '7:30 PM',
      ingredients: ['150g lean steak', 'Sweet potato', 'Broccoli', 'Olive oil'],
      imagePath: 'assets/images/food/dinner/steak.jpg',
      description: 'Protein-rich dinner option',
    ),
  ];
} 