// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/widgets/module_widget.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_gym.dart';
import 'package:pbl_fitness_app/data/gym_data.dart';

class BackScreen extends StatelessWidget {
  final List<Map<String, dynamic>> backExercises = [
    {
      'id': 'b1',
      'title': 'Barbell Deadlift',
      'image': 'assets/images/gym/back/deadlift.jpg',
      'equipment': ['Barbell', 'Weight Plates'],
    },
    {
      'id': 'b2',
      'title': 'Bent-Over Barbell Row',
      'image': 'assets/images/gym/back/bent_over.jpg',
      'equipment': ['Barbell', 'Weight Plates'],
    },
    {
      'id': 'b3',
      'title': 'Wide-Grip Pull-Up',
      'image': 'assets/images/gym/back/pull_up.jpg',
      'equipment': ['Pull-up Bar'],
    },
    {
      'id': 'b4',
      'title': 'Standing T-Bar Row',
      'image': 'assets/images/gym/back/t_bar_row.jpg',
      'equipment': ['T-Bar', 'Weight Plates'],
    },
    {
      'id': 'b5',
      'title': 'Seated Cable Row',
      'image': 'assets/images/gym/back/cable_row.jpg',
      'equipment': ['Cable Machine'],
    },
    {
      'id': 'b6',
      'title': 'Close-Grip Pull-Down',
      'image': 'assets/images/gym/back/pull_down.jpg',
      'equipment': ['Cable Machine'],
    },
    {
      'id': 'b7',
      'title': 'Single-Arm Dumbbell Row',
      'image': 'assets/images/gym/back/dumbell_row.jpg',
      'equipment': ['Dumbbell'],
    },
    {
      'id': 'b8',
      'title': 'Decline Bench Dumbbell Pull-Over',
      'image': 'assets/images/gym/back/decline_pull.jpg',
      'equipment': ['Dumbbell', 'Bench'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Back Exercises',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: backExercises.length,
        itemBuilder: (context, index) {
          final exercise = backExercises[index];
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
                                  'Back',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              ...exercise['equipment'].map<Widget>((equipment) => 
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(20),
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
                              ).toList(),
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
