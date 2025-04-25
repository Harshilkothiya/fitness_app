import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/widgets/module_widget.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_gym.dart';
import 'package:pbl_fitness_app/data/gym_data.dart';

class ChestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Chest',
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
                  'c1',
                  exercise:
                      gymData.firstWhere((exercise) => exercise.id == 'c1'),
                ),
                'Barbell Bench Press',
                'assets/images/gym/chest/barbell.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  'c2',
                  exercise:
                      gymData.firstWhere((exercise) => exercise.id == 'c2'),
                ),
                'Flat Bench Dumbbell Press',
                'assets/images/gym/chest/flat_dumbell.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  'c3',
                  exercise:
                      gymData.firstWhere((exercise) => exercise.id == 'c3'),
                ),
                'Low-Incline Barbell Bench Press',
                'assets/images/gym/chest/low_incline.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  'c4',
                  exercise:
                      gymData.firstWhere((exercise) => exercise.id == 'c4'),
                ),
                'Seated Machine Chest Press',
                'assets/images/gym/chest/machine_press.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  'c5',
                  exercise:
                      gymData.firstWhere((exercise) => exercise.id == 'c5'),
                ),
                'Incline Dumbbell Press',
                'assets/images/gym/chest/incline_dumbell_press.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  'c6',
                  exercise:
                      gymData.firstWhere((exercise) => exercise.id == 'c6'),
                ),
                'Dips For Chest',
                'assets/images/gym/chest/chest_dips.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  'c7',
                  exercise:
                      gymData.firstWhere((exercise) => exercise.id == 'c7'),
                ),
                'Incline Bench Cable Fly',
                'assets/images/gym/chest/cable_fly.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  'c8',
                  exercise:
                      gymData.firstWhere((exercise) => exercise.id == 'c8'),
                ),
                'Pec-Deck Machine',
                'assets/images/gym/chest/pec_deck.jpg'),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
