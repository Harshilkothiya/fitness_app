import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/data/gym_data.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_gym.dart';

class ShoulderScreen extends StatelessWidget {
  final List<Map<String, dynamic>> shoulderExercises = [
    {
      'id': 's1',
      'title': 'Barbell Overhead Shoulder Press',
      'image': 'assets/images/gym/shoulder/barbell_overhead.jpg',
      'equipment': ['Barbell', 'Weight Plates'],
    },
    {
      'id': 's2',
      'title': 'Seated Dumbbell Shoulder Press',
      'image': 'assets/images/gym/shoulder/seated_dumbell.jpg',
      'equipment': ['Dumbbells'],
    },
    {
      'id': 's3',
      'title': 'Front Raise',
      'image': 'assets/images/gym/shoulder/front_raise.jpg',
      'equipment': ['Dumbbells'],
    },
    {
      'id': 's4',
      'title': 'Reverse Pec Deck Fly',
      'image': 'assets/images/gym/shoulder/reverse_pec_deck.jpg',
      'equipment': ['Machine'],
    },
    {
      'id': 's5',
      'title': 'Bent-Over Dumbbell Lateral Raise',
      'image': 'assets/images/gym/shoulder/bent_over.jpg',
      'equipment': ['Dumbbells'],
    },
    {
      'id': 's6',
      'title': 'Dumbbell Lateral Raise',
      'image': 'assets/images/gym/shoulder/lateral_rise.jpg',
      'equipment': ['Dumbbells'],
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
          'Shoulder Exercises',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: shoulderExercises.length,
        itemBuilder: (context, index) {
          final exercise = shoulderExercises[index];
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
                                  'Shoulder',
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
