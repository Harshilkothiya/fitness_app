import 'package:flutter/material.dart';
import '../widgets/module_widget_yoga.dart';
import '../widgets/sub_module_widget_yoga.dart';
import '../data/yoga_data.dart';
import '../models/yoga.dart';

class SivaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Sivananda Yoga',
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
                's1',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 's1'),
              ),
              'ANULOMA VILOMA',
              'assets/images/yoga/siva/anulom.jpg',
              'Anuloma Viloma',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                's2',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 's2'),
              ),
              'BACKBEND',
              'assets/images/yoga/siva/backbend.jpg',
              'Backbend',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                's3',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 's3'),
              ),
              'ANJANEYASANA',
              'assets/images/yoga/siva/anja.jpg',
              'Anjaneyasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                's4',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 's4'),
              ),
              'KNEES, CHEST, CHIN',
              'assets/images/yoga/siva/kcc.jpg',
              'Ashtanga Namaskara',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                's5',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 's5'),
              ),
              'BHUJANGASANA',
              'assets/images/yoga/siva/bhu.jpg',
              'Bhujangasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                's6',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 's6'),
              ),
              'LOW LUNGE',
              'assets/images/yoga/siva/low_lunge.jpg',
              'Low Lunge',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                's7',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 's7'),
              ),
              'BALASANA',
              'assets/images/yoga/siva/bala.jpg',
              'Balasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                's8',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 's8'),
              ),
              'HALASANA',
              'assets/images/yoga/siva/hala.jpg',
              'Halasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                's9',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 's9'),
              ),
              'MATSYASANA',
              'assets/images/yoga/siva/matsya.jpg',
              'Matsyasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                's10',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 's10'),
              ),
              'PASCHIMOTTANASANA',
              'assets/images/yoga/siva/paschi.jpg',
              'Paschimottanasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                's11',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 's11'),
              ),
              'REST',
              'assets/images/yoga/siva/rest.jpg',
              'Savasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                's12',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 's12'),
              ),
              'SALABHASANA',
              'assets/images/yoga/siva/salabh.jpg',
              'Salabhasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                's13',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 's13'),
              ),
              'DHANURASANA',
              'assets/images/yoga/siva/dhanu.jpg',
              'Dhanurasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                's14',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 's14'),
              ),
              'CHILD\'S POSE',
              'assets/images/yoga/siva/child.jpg',
              'Balasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                's15',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 's15'),
              ),
              'ARDHA MATSYENDRASANA',
              'assets/images/yoga/siva/ardha_matsy.jpg',
              'Ardha Matsyendrasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                's16',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 's16'),
              ),
              'PADA HASTASANA',
              'assets/images/yoga/siva/pada.jpg',
              'Pada Hastasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                's17',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 's17'),
              ),
              'EASY POSE',
              'assets/images/yoga/siva/easy.jpg',
              'Sukhasana',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
