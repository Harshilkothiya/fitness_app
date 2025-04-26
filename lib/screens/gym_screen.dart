import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/gym/abs.dart';
import 'package:pbl_fitness_app/gym/back.dart';
import 'package:pbl_fitness_app/gym/biceps.dart';
import 'package:pbl_fitness_app/gym/chest.dart';
import 'package:pbl_fitness_app/gym/legs.dart';
import 'package:pbl_fitness_app/gym/shoulder.dart';
import 'package:pbl_fitness_app/gym/triceps.dart';

class GymScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Shoulder',
      'icon': Icons.fitness_center,
      'screen': ShoulderScreen(),
      'description': 'Build shoulder strength and definition',
      'iconColor': Color(0xFF6448FE),
      'iconBgColor': Color(0xFFF0EEFF),
    },
    {
      'title': 'Legs',
      'icon': Icons.accessibility_new,
      'screen': LegsScreen(),
      'description': 'Strengthen your lower body',
      'iconColor': Color(0xFF5FC6FF),
      'iconBgColor': Color(0xFFEFF8FF),
    },
    {
      'title': 'Back',
      'icon': Icons.airline_seat_flat,
      'screen': BackScreen(),
      'description': 'Improve posture and back muscles',
      'iconColor': Color(0xFF6448FE),
      'iconBgColor': Color(0xFFF0EEFF),
    },
    {
      'title': 'Chest',
      'icon': Icons.fitness_center,
      'screen': ChestScreen(),
      'description': 'Build chest strength and mass',
      'iconColor': Color(0xFF5FC6FF),
      'iconBgColor': Color(0xFFEFF8FF),
    },
    {
      'title': 'Biceps',
      'icon': Icons.sports_gymnastics,
      'screen': BicepsScreen(),
      'description': 'Develop arm strength',
      'iconColor': Color(0xFF6448FE),
      'iconBgColor': Color(0xFFF0EEFF),
    },
    {
      'title': 'Triceps',
      'icon': Icons.sports_martial_arts,
      'screen': TricepsScreen(),
      'description': 'Shape and tone your arms',
      'iconColor': Color(0xFF5FC6FF),
      'iconBgColor': Color(0xFFEFF8FF),
    },
    {
      'title': 'Abs',
      'icon': Icons.straighten,
      'screen': AbsScreen(),
      'description': 'Build core strength',
      'iconColor': Color(0xFF6448FE),
      'iconBgColor': Color(0xFFF0EEFF),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon:
                        Icon(Icons.arrow_back, color: Colors.black87, size: 24),
                    onPressed: () => Navigator.of(context).pop(),
                    padding: EdgeInsets.zero,
                  ),
                  Text(
                    'Gym Exercises',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1.0,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => category['screen'],
                        ),
                      );
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 150),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                            color: category['iconColor'].withOpacity(0.12),
                            width: 1.2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: category['iconBgColor'],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              category['icon'],
                              color: category['iconColor'],
                              size: 32,
                            ),
                          ),
                          SizedBox(height: 18),
                          Text(
                            category['title'],
                            style: TextStyle(
                              color: Color(0xFF222B45),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            category['description'],
                            style: TextStyle(
                              color: Color(0xFF6E7582),
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
