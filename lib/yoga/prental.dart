import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/widgets/module_widget_yoga.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_yoga.dart';
import 'package:pbl_fitness_app/data/yoga_data.dart';
import 'package:pbl_fitness_app/models/yoga.dart';

class PrentalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Prental Yoga',
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
                'p1',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'p1'),
              ),
              'Sukhasana (Easy Pose)',
              'assets/images/yoga/prental/sukh.jpg',
              'Sukhasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'p2',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'p2'),
              ),
              'Side Bends',
              'assets/images/yoga/prental/side.jpg',
              'Side Bends',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'p3',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'p3'),
              ),
              'Sufi Rolls',
              'assets/images/yoga/prental/sufi.jpg',
              'Sufi Rolls',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'p4',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'p4'),
              ),
              'Cat and Cow',
              'assets/images/yoga/prental/cat_cow.jpg',
              'Marjaryasana/Bitilasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'p5',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'p5'),
              ),
              'Vajrasana (Thunderbolt Pose)',
              'assets/images/yoga/prental/vajra.jpg',
              'Vajrasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'p6',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'p6'),
              ),
              'Vasisthasana (Side Plank Pose, variation)',
              'assets/images/yoga/prental/vasi.jpg',
              'Vasisthasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'p7',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'p7'),
              ),
              'Virabhadrasana II (Warrior Pose II)',
              'assets/images/yoga/prental/vi2.jpg',
              'Virabhadrasana II',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'p8',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'p8'),
              ),
              'Utthita Trikonasana (Extended Triangle Pose)',
              'assets/images/yoga/prental/trikon.jpg',
              'Utthita Trikonasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'p9',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'p9'),
              ),
              'Temple pose',
              'assets/images/yoga/prental/temple.jpg',
              'Temple pose',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'p10',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'p10'),
              ),
              'Prasarita Padottanasana (Wide-Legged Standing Forward Bend, variation)',
              'assets/images/yoga/prental/prasarita.jpg',
              'Prasarita Padottanasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'p11',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'p11'),
              ),
              'Malasana (Garland Pose)',
              'assets/images/yoga/prental/mala.jpg',
              'Malasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'p12',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'p12'),
              ),
              'Hanumanasana (Monkey God Pose, variation)',
              'assets/images/yoga/prental/hanu.jpg',
              'Hanumanasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'p13',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'p13'),
              ),
              'Upavistha Konasana (Wide-Angle Seated Forward Bend)',
              'assets/images/yoga/prental/kona.jpg',
              'Upavistha Konasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'p14',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'p14'),
              ),
              'Tarasana (Star Pose)',
              'assets/images/yoga/prental/tara.jpg',
              'Tarasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'p15',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'p15'),
              ),
              'Seated Meditation',
              'assets/images/yoga/prental/seated.jpg',
              'Seated Meditation',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'p16',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'p16'),
              ),
              'Supta Baddha Konasana (Reclining Bound Angle Pose)',
              'assets/images/yoga/prental/supta.jpg',
              'Supta Baddha Konasana',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
