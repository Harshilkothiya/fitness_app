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
      'image': 'assets/images/gym/shoulder/banner.jpg',
      'screen': ShoulderScreen(),
    },
    {
      'title': 'Legs',
      'image': 'assets/images/gym/legs/banner.jpg',
      'screen': LegsScreen(),
    },
    {
      'title': 'Back',
      'image': 'assets/images/gym/back/banner.jpg',
      'screen': BackScreen(),
    },
    {
      'title': 'Chest',
      'image': 'assets/images/gym/chest/banner.jpg',
      'screen': ChestScreen(),
    },
    {
      'title': 'Biceps',
      'image': 'assets/images/gym/bicep/banner.jpg',
      'screen': BicepScreen(),
    },
    {
      'title': 'Triceps',
      'image': 'assets/images/gym/triceps/banner.jpg',
      'screen': TricepsScreen(),
    },
    {
      'title': 'Abs',
      'image': 'assets/images/gym/abs/banner.jpg',
      'screen': AbsScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/gym/banner.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.purple.withOpacity(0.6),
                    Colors.purple.withOpacity(0.3),
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      Spacer(),
                      Text(
                        'Gym Exercises',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.1,
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
 