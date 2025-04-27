import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/data/gym_data.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_gym.dart';

class ChestScreen extends StatelessWidget {
  final List<Map<String, dynamic>> chestExercises = [
    {
      'id': 'c1',
      'title': 'Barbell Bench Press',
      'image': 'assets/images/gym/chest/bench_press.jpg',
      'equipment': ['Barbell', 'Weight Plates', 'Bench'],
    },
    {
      'id': 'c2',
      'title': 'Dumbbell Bench Press',
      'image': 'assets/images/gym/chest/dumbbell_press.jpg',
      'equipment': ['Dumbbells', 'Bench'],
    },
    {
      'id': 'c3',
      'title': 'Incline Bench Press',
      'image': 'assets/images/gym/chest/incline_press.jpg',
      'equipment': ['Barbell', 'Weight Plates', 'Incline Bench'],
    },
    {
      'id': 'c4',
      'title': 'Decline Bench Press',
      'image': 'assets/images/gym/chest/decline_press.jpg',
      'equipment': ['Barbell', 'Weight Plates', 'Decline Bench'],
    },
    {
      'id': 'c5',
      'title': 'Dumbbell Flyes',
      'image': 'assets/images/gym/chest/flyes.jpg',
      'equipment': ['Dumbbells', 'Bench'],
    },
    {
      'id': 'c6',
      'title': 'Cable Crossover',
      'image': 'assets/images/gym/chest/cable_cross.jpg',
      'equipment': ['Cable Machine'],
    },
    {
      'id': 'c7',
      'title': 'Push-Ups',
      'image': 'assets/images/gym/chest/pushup.jpg',
      'equipment': ['None'],
    },
    {
      'id': 'c8',
      'title': 'Chest Dips',
      'image': 'assets/images/gym/chest/dips.jpg',
      'equipment': ['Dip Bars'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF4B45B2),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Chest Exercises',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: chestExercises.length,
        itemBuilder: (context, index) {
          final exercise = chestExercises[index];
          final gymExercise = gymData.firstWhere(
            (e) => e.id == exercise['id'],
            orElse: () => gymData.first,
          );

          return Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubModuleWidgetGym(
                      exercise['id'],
                      exercise: gymExercise,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.fitness_center,
                          size: 48,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            exercise['title'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Chest',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              ...exercise['equipment']
                                  .map<Widget>(
                                    (equipment) => Padding(
                                      padding: EdgeInsets.only(right: 8),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          equipment,
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.blue[400],
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
