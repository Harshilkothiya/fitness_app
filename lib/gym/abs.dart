import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/data/gym_data.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_gym.dart';

class AbsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> absExercises = [
    {
      'id': 'a1',
      'title': 'Exercise Ball Pull-In',
      'image': 'assets/images/gym/abs/ball_pull.jpg',
      'equipment': ['Exercise Ball'],
    },
    {
      'id': 'a2',
      'title': 'Dumbbell Crunch',
      'image': 'assets/images/gym/abs/dumbbell_crunch.jpg',
      'equipment': ['Dumbbell'],
    },
    {
      'id': 'a3',
      'title': 'Tuck and Crunch',
      'image': 'assets/images/gym/abs/tuck_crunch.jpg',
      'equipment': ['None'],
    },
    {
      'id': 'a4',
      'title': 'Modified V-Sit',
      'image': 'assets/images/gym/abs/v_sit.jpg',
      'equipment': ['None'],
    },
    {
      'id': 'a5',
      'title': 'Crunch',
      'image': 'assets/images/gym/abs/crunch.jpg',
      'equipment': ['None'],
    },
    {
      'id': 'a6',
      'title': 'Hanging Leg Raise',
      'image': 'assets/images/gym/abs/leg_raise.jpg',
      'equipment': ['Pull-up Bar'],
    },
    {
      'id': 'a7',
      'title': 'Hanging Knee Raise Twist',
      'image': 'assets/images/gym/abs/knee_twist.jpg',
      'equipment': ['Pull-up Bar'],
    },
    {
      'id': 'a8',
      'title': 'Hanging Knee Raise',
      'image': 'assets/images/gym/abs/knee_raise.jpg',
      'equipment': ['Pull-up Bar'],
    },
    {
      'id': 'a9',
      'title': 'Garhammer Raise',
      'image': 'assets/images/gym/abs/garhammer.jpg',
      'equipment': ['Pull-up Bar'],
    },
    {
      'id': 'a10',
      'title': 'Decline Plank with Foot Touch',
      'image': 'assets/images/gym/abs/decline_plank.jpg',
      'equipment': ['Bench'],
    },
    {
      'id': 'a11',
      'title': 'Seated Russian Twist',
      'image': 'assets/images/gym/abs/russian_twist.jpg',
      'equipment': ['Weight Plate'],
    },
    {
      'id': 'a12',
      'title': 'Bicycle Crunches',
      'image': 'assets/images/gym/abs/bicycle.jpg',
      'equipment': ['None'],
    },
    {
      'id': 'a13',
      'title': 'Plank',
      'image': 'assets/images/gym/abs/plank.jpg',
      'equipment': ['None'],
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
          'Abs Exercises',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: absExercises.length,
        itemBuilder: (context, index) {
          final exercise = absExercises[index];
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
                                  'Abs',
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
