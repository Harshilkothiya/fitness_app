class Exercise {
  final String name;
  final int sets;
  final int reps;
  final int duration;
  final int timer; // Timer for each set in seconds
  final double
      caloriesPerMinute; // Calories burned per minute for this exercise

  Exercise({
    required this.name,
    required this.sets,
    required this.reps,
    required this.duration,
    required this.timer,
    required this.caloriesPerMinute,
  });

  get weight => null;

  // Calculate total calories burned for the exercise
  double get totalCaloriesBurned => (duration / 60) * caloriesPerMinute;
}
