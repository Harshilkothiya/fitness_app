import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/widgets/module_widget_yoga.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_yoga.dart';
import 'package:pbl_fitness_app/data/yoga_data.dart';
import 'package:pbl_fitness_app/models/yoga.dart';

class AerialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Aerial Yoga',
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
                'ae1',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ae1'),
              ),
              'Layback in the Cross Position',
              'assets/images/yoga/aerial/layback.jpg',
              'Layback in the Cross Position',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'ae2',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ae2'),
              ),
              'Chair in the Cross Position',
              'assets/images/yoga/aerial/chair.jpg',
              'Chair in the Cross Position',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'ae3',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ae3'),
              ),
              'Shoulder Stretch in Wrist Wrap',
              'assets/images/yoga/aerial/shoulder_wrap.jpg',
              'Shoulder Stretch in Wrist Wrap',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'ae4',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ae4'),
              ),
              'Plank with the Feet in the Hammock',
              'assets/images/yoga/aerial/plank.jpg',
              'Plank with the Feet in the Hammock',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'ae5',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ae5'),
              ),
              'Low Lunge in Wrist Wrap',
              'assets/images/yoga/aerial/low_lunge.jpg',
              'Low Lunge in Wrist Wrap',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'ae6',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ae6'),
              ),
              'Pike and Pull with the Foot in the Hammock',
              'assets/images/yoga/aerial/pike_pull.jpg',
              'Pike and Pull with the Foot in the Hammock',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'ae7',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ae7'),
              ),
              'Star Inversion',
              'assets/images/yoga/aerial/star.jpg',
              'Star Inversion',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'ae8',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ae8'),
              ),
              'Floating Savasana with Assisted Foot and Back Massage',
              'assets/images/yoga/aerial/massage.jpg',
              'Floating Savasana with Assisted Foot and Back Massage',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
