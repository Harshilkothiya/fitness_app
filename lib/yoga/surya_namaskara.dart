import 'package:flutter/material.dart';
import '../widgets/module_widget_yoga.dart';
import '../widgets/sub_module_widget_yoga.dart';
import '../data/yoga_data.dart';
import '../models/yoga.dart';

class SuryaNamaskaraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Surya Namaskara',
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
                'su1',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'su1'),
              ),
              'Pranamasana',
              'assets/images/yoga/surya/su1.png',
              'Pranamasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'su2',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'su2'),
              ),
              'Hastauttanasana',
              'assets/images/yoga/surya/su2.png',
              'Hastauttanasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'su3',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'su3'),
              ),
              'Hasta Padasana',
              'assets/images/yoga/surya/su3.png',
              'Hasta Padasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'su4',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'su4'),
              ),
              'Ashwa Sanchalanasana',
              'assets/images/yoga/surya/su4.png',
              'Ashwa Sanchalanasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'su5',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'su5'),
              ),
              'Dandasana',
              'assets/images/yoga/surya/su5.png',
              'Dandasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'su6',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'su6'),
              ),
              'Ashtanga Namaskara',
              'assets/images/yoga/surya/su6.png',
              'Ashtanga Namaskara',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'su7',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'su7'),
              ),
              'Bhujagasana',
              'assets/images/yoga/surya/su7.png',
              'Bhujagasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'su8',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'su8'),
              ),
              'Parvatasana',
              'assets/images/yoga/surya/su8.png',
              'Parvatasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'su9',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'su9'),
              ),
              'Ashwa Sanchalanasana',
              'assets/images/yoga/surya/su9.png',
              'Ashwa Sanchalanasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'su10',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'su10'),
              ),
              'Hasta Padasana',
              'assets/images/yoga/surya/su10.png',
              'Hasta Padasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'su11',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'su11'),
              ),
              'Hastauttanasana',
              'assets/images/yoga/surya/su11.png',
              'Hastauttanasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'su12',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'su12'),
              ),
              'Pranamasana',
              'assets/images/yoga/surya/su12.png',
              'Pranamasana',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
