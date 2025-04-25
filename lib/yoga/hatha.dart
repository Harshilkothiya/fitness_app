import 'package:flutter/material.dart';
import '../widgets/module_widget_yoga.dart';
import '../widgets/sub_module_widget_yoga.dart';
import '../data/yoga_data.dart';
import '../models/yoga.dart';

class HathaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Hatha Yoga',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'QuickSand',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'h1',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'h1'),
              ),
              'Tadasana (Mountain Pose)',
              'assets/images/yoga/hatha/tadasana.png',
              'Tadasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'h2',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'h2'),
              ),
              'Vrikshasana (Tree Pose)',
              'assets/images/yoga/hatha/vri.png',
              'Vrikshasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'h3',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'h3'),
              ),
              'Adho Mukh Swanasana (Downward Facing Dog Pose)',
              'assets/images/yoga/hatha/adho.png',
              'Adho Mukh Swanasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'h4',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'h4'),
              ),
              'Setu Bandhasana (Bridge Pose)',
              'assets/images/yoga/hatha/setu.png',
              'Setu Bandhasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'h5',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'h5'),
              ),
              'Halasana (Plough Pose)',
              'assets/images/yoga/hatha/halasana.jpg',
              'Halasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'h6',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'h6'),
              ),
              'Sirsana (Head Stand)',
              'assets/images/yoga/hatha/sir.png',
              'Sirsana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'h7',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'h7'),
              ),
              'Salabhasana (Locust Pose)',
              'assets/images/yoga/hatha/salabh.png',
              'Salabhasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'h8',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'h8'),
              ),
              'Sarvangasana (Shoulder Stand)',
              'assets/images/yoga/hatha/sarvang.png',
              'Sarvangasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'h9',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'h9'),
              ),
              'Dhanurasana (Bow Pose)',
              'assets/images/yoga/hatha/dhanu.png',
              'Dhanurasana',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
