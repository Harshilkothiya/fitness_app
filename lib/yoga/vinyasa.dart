import 'package:flutter/material.dart';
import '../widgets/module_widget_yoga.dart';
import '../widgets/sub_module_widget_yoga.dart';
import '../data/yoga_data.dart';
import '../models/yoga_model.dart';

class VinyasaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Vinyasa Yoga',
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
                'v1',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'v1'),
              ),
              'Cat-Cow Stretch or Pose (Bidalasana)',
              'assets/images/yoga/vinyasa/cat_cow.jpg',
              'Bidalasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'v2',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'v2'),
              ),
              'Side Plank Pose (Vasisthasana)',
              'assets/images/yoga/vinyasa/side.jpg',
              'Vasisthasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'v3',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'v3'),
              ),
              'Standing Forward Bend (Uttanasana)',
              'assets/images/yoga/vinyasa/bend.jpg',
              'Uttanasana',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
