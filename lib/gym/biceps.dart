import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/data/gym_data.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_gym.dart';

class BicepsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> bicepsExercises = [
    {
      'id': 'bi1',
      'title': 'Standing Barbell Curl',
      'image': 'assets/images/gym/biceps/barbell_curl.jpg',
      'equipment': ['Barbell', 'Weight Plates'],
    },
    {
      'id': 'bi2',
      'title': 'Dumbbell Curl',
      'image': 'assets/images/gym/biceps/dumbbell_curl.jpg',
      'equipment': ['Dumbbells'],
    },
    {
      'id': 'bi3',
      'title': 'Hammer Curl',
      'image': 'assets/images/gym/biceps/hammer_curl.jpg',
      'equipment': ['Dumbbells'],
    },
    {
      'id': 'bi4',
      'title': 'Preacher Curl',
      'image': 'assets/images/gym/biceps/preacher_curl.jpg',
      'equipment': ['Preacher Bench', 'Barbell'],
    },
    {
      'id': 'bi5',
      'title': 'Concentration Curl',
      'image': 'assets/images/gym/biceps/concentration_curl.jpg',
      'equipment': ['Dumbbell', 'Bench'],
    },
    {
      'id': 'bi6',
      'title': 'Cable Curl',
      'image': 'assets/images/gym/biceps/cable_curl.jpg',
      'equipment': ['Cable Machine'],
    },
    {
      'id': 'bi7',
      'title': 'Incline Dumbbell Curl',
      'image': 'assets/images/gym/biceps/incline_curl.jpg',
      'equipment': ['Dumbbells', 'Incline Bench'],
    },
    {
      'id': 'bi8',
      'title': 'EZ Bar Curl',
      'image': 'assets/images/gym/biceps/ez_curl.jpg',
      'equipment': ['EZ Bar', 'Weight Plates'],
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
          'Biceps Exercises',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: bicepsExercises.length,
        itemBuilder: (context, index) {
          final exercise = bicepsExercises[index];
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
                            exercise['title'] as String,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 12),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
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
                                    'Biceps',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                ...(exercise['equipment'] as List)
                                    .map(
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
                                            equipment.toString(),
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
