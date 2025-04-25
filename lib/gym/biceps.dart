import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/widgets/module_widget.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_gym.dart';
import 'package:pbl_fitness_app/data/gym_data.dart';

class BicepScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Biceps',
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'QuickSand',
              fontWeight: FontWeight.bold),
        )),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            ModuleWidget(
                SubModuleWidgetGym(
                  'bi1',
                  exercise: gymData.firstWhere((exercise) => exercise.id == 'bi1'),
                ),
                'Incline Dumbbell Hammer Curl',
                'assets/images/gym/bicep/hammer_curl.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  'bi2',
                  exercise: gymData.firstWhere((exercise) => exercise.id == 'bi2'),
                ),
                'Incline Inner-Biceps Curl',
                'assets/images/gym/bicep/incline_hammer_curl.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  'bi3',
                  exercise: gymData.firstWhere((exercise) => exercise.id == 'bi3'),
                ),
                'EZ-Bar Curl',
                'assets/images/gym/bicep/ez_bar_curl.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  'bi4',
                  exercise: gymData.firstWhere((exercise) => exercise.id == 'bi4'),
                ),
                'Wide-Grip Standing Barbell Curl',
                'assets/images/gym/bicep/wide_curl.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  'bi5',
                  exercise: gymData.firstWhere((exercise) => exercise.id == 'bi5'),
                ),
                'Zottman Curl',
                'assets/images/gym/bicep/zottman_curl.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  'bi6',
                  exercise: gymData.firstWhere((exercise) => exercise.id == 'bi6'),
                ),
                'Barbell Curl',
                'assets/images/gym/bicep/barbell_curl.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  'bi7',
                  exercise: gymData.firstWhere((exercise) => exercise.id == 'bi7'),
                ),
                'Hammer Curl',
                'assets/images/gym/bicep/hammer_curl.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  'bi8',
                  exercise: gymData.firstWhere((exercise) => exercise.id == 'bi8'),
                ),
                'Overhead Cable Curl',
                'assets/images/gym/bicep/cable_curl.jpg'),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
