import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/widgets/module_widget_yoga.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_yoga.dart';
import 'package:pbl_fitness_app/data/yoga_data.dart';
import 'package:pbl_fitness_app/models/yoga.dart';

class JivmuktiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Jivmukti Yoga',
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
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'j1',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'j1'),
              ),
              'Monkey Pose (Hanumanasana)',
              'assets/images/yoga/jivmukti/monkey.jpg',
              'Hanumanasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'j2',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'j2'),
              ),
              'Dancing Shiva Pose (Natrajasana)',
              'assets/images/yoga/jivmukti/dancing.jpg',
              'Natrajasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'j3',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'j3'),
              ),
              'Bow Pose (Dhanurasana)',
              'assets/images/yoga/jivmukti/bow.jpg',
              'Dhanurasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'j4',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'j4'),
              ),
              'Peacock Pose (Mayurasana)',
              'assets/images/yoga/jivmukti/mayur.jpg',
              'Mayurasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'j5',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'j5'),
              ),
              'Hero Pose (Virasana)',
              'assets/images/yoga/jivmukti/hero.jpg',
              'Virasana',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
