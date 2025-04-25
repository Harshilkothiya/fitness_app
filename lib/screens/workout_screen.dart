import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/widgets/dark_theme_widget.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Workout Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Add workout categories here
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to specific workout category
              },
              child: const Text('Gym Workouts'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to specific workout category
              },
              child: const Text('Cardio'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to specific workout category
              },
              child: const Text('Yoga'),
            ),
          ],
        ),
      ),
    );
  }
}
