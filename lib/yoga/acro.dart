import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/widgets/module_widget_yoga.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_yoga.dart';
import 'package:pbl_fitness_app/data/yoga_data.dart';
import 'package:pbl_fitness_app/models/yoga.dart';

class AcroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Acro Yoga',
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
                'ac1',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ac1'),
              ),
              'Plank on Plank',
              'assets/images/yoga/acro/plank_on_plank.jpg',
              'Plank on Plank',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'ac2',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ac2'),
              ),
              'Plank Press',
              'assets/images/yoga/acro/press.jpg',
              'Plank Press',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'ac3',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ac3'),
              ),
              'Folded Leaf',
              'assets/images/yoga/acro/leaf.jpg',
              'Folded Leaf',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'ac4',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ac4'),
              ),
              'Front Plank',
              'assets/images/yoga/acro/front.jpg',
              'Front Plank',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'ac5',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ac5'),
              ),
              'Partner Forward Folds',
              'assets/images/yoga/acro/partner.jpg',
              'Partner Forward Folds',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'ac6',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ac6'),
              ),
              'Fish on a Rock',
              'assets/images/yoga/acro/fish.jpg',
              'Fish on a Rock',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'ac7',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ac7'),
              ),
              'Down Dog L-Shape',
              'assets/images/yoga/acro/down_dog.jpg',
              'Down Dog L-Shape',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'ac8',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ac8'),
              ),
              'Foot to Hand',
              'assets/images/yoga/acro/foot_to_hand.jpg',
              'Foot to Hand',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'ac9',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ac9'),
              ),
              'Chair Pose on Shins',
              'assets/images/yoga/acro/chair.jpg',
              'Chair Pose on Shins',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'ac10',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'ac10'),
              ),
              'Jedi Plank',
              'assets/images/yoga/acro/jedi.jpg',
              'Jedi Plank',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
