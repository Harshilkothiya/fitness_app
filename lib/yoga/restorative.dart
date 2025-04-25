import 'package:flutter/material.dart';
import '../widgets/module_widget_yoga.dart';
import '../widgets/sub_module_widget_yoga.dart';
import '../data/yoga_data.dart';
import '../models/yoga.dart';

class RestorativeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Restorative Yoga',
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
                'r1',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'r1'),
              ),
              'Savasana with Shins Supported on Chair',
              'assets/images/yoga/restorative/chair.jpg',
              'Savasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'r2',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'r2'),
              ),
              'Supported Supine Twist',
              'assets/images/yoga/restorative/twist.jpg',
              'Jathara Parivartanasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'r3',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'r3'),
              ),
              'Supported Lounging Pigeon',
              'assets/images/yoga/restorative/pigeon.jpg',
              'Eka Pada Rajakapotasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'r4',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'r4'),
              ),
              'Supported Backbend',
              'assets/images/yoga/restorative/backbend.jpg',
              'Matsyasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'r5',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'r5'),
              ),
              'Supported Supine Hero\'s Pose',
              'assets/images/yoga/restorative/hero.jpg',
              'Supta Virasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'r6',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'r6'),
              ),
              'Supported Bound Angle Pose',
              'assets/images/yoga/restorative/angle.jpg',
              'Baddha Konasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'r7',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'r7'),
              ),
              'Supported Child\'s Pose',
              'assets/images/yoga/restorative/child.jpg',
              'Balasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'r8',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'r8'),
              ),
              'Supported Vertical Leg Extension',
              'assets/images/yoga/restorative/extension.jpg',
              'Viparita Karani',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
