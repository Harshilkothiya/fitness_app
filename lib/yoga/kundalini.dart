import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/widgets/module_widget_yoga.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_yoga.dart';
import 'package:pbl_fitness_app/data/yoga_data.dart';
import 'package:pbl_fitness_app/models/yoga.dart';

class KundaliniScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Kundalini Yoga',
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
                'k1',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'k1'),
              ),
              'Crow Pose',
              'assets/images/yoga/kundalini/crow.jpg',
              'Bakasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'k2',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'k2'),
              ),
              'Frog Pose',
              'assets/images/yoga/kundalini/frog.jpg',
              'Mandukasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'k3',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'k3'),
              ),
              'Stretch Pose',
              'assets/images/yoga/kundalini/stretch.jpg',
              'Stretch Pose',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'k4',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'k4'),
              ),
              'Camel Pose',
              'assets/images/yoga/kundalini/camel.jpg',
              'Ustrasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'k5',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'k5'),
              ),
              'Cobra Pose',
              'assets/images/yoga/kundalini/cobra.jpg',
              'Bhujangasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'k6',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'k6'),
              ),
              'Guru Pranam',
              'assets/images/yoga/kundalini/guru.jpg',
              'Guru Pranam',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'k7',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'k7'),
              ),
              'Sat Kriya',
              'assets/images/yoga/kundalini/sat_kriya.jpg',
              'Sat Kriya',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
