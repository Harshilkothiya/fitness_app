import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/widgets/module_widget_yoga.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_yoga.dart';
import 'package:pbl_fitness_app/data/yoga_data.dart';
import 'package:pbl_fitness_app/models/yoga.dart';

class YinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Yin Yoga',
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
                'y1',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'y1'),
              ),
              'Butterfly',
              'assets/images/yoga/yin/butterfly.jpg',
              'Butterfly',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'y2',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'y2'),
              ),
              'Sphinx',
              'assets/images/yoga/yin/sphinx.jpg',
              'Sphinx',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'y3',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'y3'),
              ),
              'Open Wing',
              'assets/images/yoga/yin/wing.jpg',
              'Open Wing',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'y4',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'y4'),
              ),
              "Wide-kneed Child's Pose",
              'assets/images/yoga/yin/wide_child.jpg',
              'Balasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'y5',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'y5'),
              ),
              'Dragon (A)',
              'assets/images/yoga/yin/dragon_a.jpg',
              'Dragon (A)',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'y6',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'y6'),
              ),
              'Dragon (B)',
              'assets/images/yoga/yin/dragon_b.jpg',
              'Dragon (B)',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'y7',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'y7'),
              ),
              'Dragon (C)',
              'assets/images/yoga/yin/dragon_c.jpg',
              'Dragon (C)',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'y8',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'y8'),
              ),
              'Swan',
              'assets/images/yoga/yin/swan.jpg',
              'Swan',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'y9',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'y9'),
              ),
              'Caterpillar',
              'assets/images/yoga/yin/cater.jpg',
              'Caterpillar',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'y10',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'y10'),
              ),
              'Bananasana',
              'assets/images/yoga/yin/banana.jpg',
              'Bananasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'y11',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'y11'),
              ),
              'Twisted Root',
              'assets/images/yoga/yin/root.jpg',
              'Twisted Root',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'y12',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'y12'),
              ),
              'Corpse Pose/Pentacle',
              'assets/images/yoga/yin/corpse.jpg',
              'Savasana',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
