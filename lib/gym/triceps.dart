import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/data/gym_data.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_gym.dart';

class TricepsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> tricepsExercises = [
    {
      'id': 't1',
      'title': 'Close-Grip Bench Press',
      'image': 'assets/images/gym/triceps/close_grip.jpg',
      'equipment': ['Barbell', 'Weight Plates', 'Bench'],
    },
    {
      'id': 't2',
      'title': 'Triceps Pushdown',
      'image': 'assets/images/gym/triceps/pushdown.jpg',
      'equipment': ['Cable Machine'],
    },
    {
      'id': 't3',
      'title': 'Overhead Triceps Extension',
      'image': 'assets/images/gym/triceps/overhead.jpg',
      'equipment': ['Dumbbell'],
    },
    {
      'id': 't4',
      'title': 'Diamond Push-Ups',
      'image': 'assets/images/gym/triceps/diamond.jpg',
      'equipment': ['None'],
    },
    {
      'id': 't5',
      'title': 'Skull Crushers',
      'image': 'assets/images/gym/triceps/skull.jpg',
      'equipment': ['EZ Bar', 'Weight Plates', 'Bench'],
    },
    {
      'id': 't6',
      'title': 'Rope Pushdown',
      'image': 'assets/images/gym/triceps/rope.jpg',
      'equipment': ['Cable Machine', 'Rope Attachment'],
    },
    {
      'id': 't7',
      'title': 'Dips',
      'image': 'assets/images/gym/triceps/dips.jpg',
      'equipment': ['Dip Bars'],
    },
    {
      'id': 't8',
      'title': 'Reverse Grip Pushdown',
      'image': 'assets/images/gym/triceps/reverse.jpg',
      'equipment': ['Cable Machine'],
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
          'Triceps Exercises',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: tricepsExercises.length,
        itemBuilder: (context, index) {
          final exercise = tricepsExercises[index];
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
                                    'Triceps',
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
