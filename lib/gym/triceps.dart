import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/widgets/module_widget.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_gym.dart';
import 'package:pbl_fitness_app/data/gym_data.dart';

class TricepsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Triceps',
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
                  't1',
                  exercise:
                      gymData.firstWhere((exercise) => exercise.id == 't1'),
                ),
                'Triceps Pushdown',
                'assets/images/gym/triceps/pushdown.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  't2',
                  exercise:
                      gymData.firstWhere((exercise) => exercise.id == 't2'),
                ),
                'Overhead Triceps Extension',
                'assets/images/gym/triceps/overhead.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  't3',
                  exercise:
                      gymData.firstWhere((exercise) => exercise.id == 't3'),
                ),
                'Triceps Dips',
                'assets/images/gym/triceps/dips.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  't4',
                  exercise:
                      gymData.firstWhere((exercise) => exercise.id == 't4'),
                ),
                'Close Grip Bench Press',
                'assets/images/gym/triceps/close_grip.jpg'),
            SizedBox(height: 8),
            ModuleWidget(
                SubModuleWidgetGym(
                  't5',
                  exercise:
                      gymData.firstWhere((exercise) => exercise.id == 't5'),
                ),
                'Skull Crushers',
                'assets/images/gym/triceps/skull_crushers.jpg'),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
