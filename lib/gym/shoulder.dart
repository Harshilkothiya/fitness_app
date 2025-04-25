import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/widgets/module_widget.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_gym.dart';
import 'package:pbl_fitness_app/data/gym_data.dart';

class ShoulderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1B1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Gym Exercises',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildExerciseCard(
            'Barbell Overhead Shoulder Press',
            'assets/images/gym/shoulder/barbell_overhead.jpg',
            ['Shoulder', 'Barbell, Weight Plates'],
            's1',
          ),
          SizedBox(height: 16),
          _buildExerciseCard(
            'Seated Dumbbell Shoulder Press',
            'assets/images/gym/shoulder/seated_dumbell.jpg',
            ['Shoulder', 'Dumbbells'],
            's2',
          ),
          SizedBox(height: 16),
          _buildExerciseCard(
            'Front Raise',
            'assets/images/gym/shoulder/front_raise.jpg',
            ['Shoulder', 'Dumbbells'],
            's3',
          ),
          SizedBox(height: 8),
          _buildExerciseCard(
            'Reverse Pec Deck Fly',
            'assets/images/gym/shoulder/reverse_pec_deck.jpg',
            ['Shoulder', 'Dumbbells'],
            's4',
          ),
          SizedBox(height: 8),
          _buildExerciseCard(
            'Bent-Over Dumbbell Lateral Raise',
            'assets/images/gym/shoulder/bent_over.jpg',
            ['Shoulder', 'Dumbbells'],
            's5',
          ),
          SizedBox(height: 8),
          _buildExerciseCard(
            'Dumbbell Lateral Raise',
            'assets/images/gym/shoulder/lateral_rise.jpg',
            ['Shoulder', 'Dumbbells'],
            's6',
          ),
          SizedBox(height: 8),
          _buildExerciseCard(
            'Push Press',
            'assets/images/gym/shoulder/push_press.jpg',
            ['Shoulder', 'Barbell'],
            's7',
          ),
          SizedBox(height: 8),
          _buildExerciseCard(
            'Reverse Cable Crossover',
            'assets/images/gym/shoulder/reverse_cable.jpg',
            ['Shoulder', 'Cable'],
            's8',
          ),
          SizedBox(height: 8),
          _buildExerciseCard(
            'One-Arm Cable Lateral Raise',
            'assets/images/gym/shoulder/one_arm.jpg',
            ['Shoulder', 'Cable'],
            's9',
          ),
          SizedBox(height: 8),
          _buildExerciseCard(
            'Face Pull',
            'assets/images/gym/shoulder/face_pull.webp',
            ['Shoulder', 'Dumbbells'],
            's10',
          ),
          SizedBox(height: 8),
          _buildExerciseCard(
            'High Pull',
            'assets/images/gym/shoulder/high_pull.webp',
            ['Shoulder', 'Dumbbells'],
            's11',
          ),
          SizedBox(height: 8),
          _buildExerciseCard(
            'Snatch-Grip High Pull',
            'assets/images/gym/shoulder/snatch_grip.jpg',
            ['Shoulder', 'Dumbbells'],
            's12',
          ),
          SizedBox(height: 8),
          _buildExerciseCard(
            'Trap Raise',
            'assets/images/gym/shoulder/trap_raise.webp',
            ['Shoulder', 'Dumbbells'],
            's13',
          ),
          SizedBox(height: 8),
          _buildExerciseCard(
            'Dumbbell Neutral Grip Overhead Press',
            'assets/images/gym/shoulder/dumbell_neutral.webp',
            ['Shoulder', 'Dumbbells'],
            's14',
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(
      String title, String imagePath, List<String> tags, String exerciseId) {
    return GestureDetector(
      onTap: () {
        // Handle exercise selection
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
            // Content
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: tags
                        .map((tag) => Chip(
                              label: Text(
                                tag,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              backgroundColor: Colors.black45,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 0),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
