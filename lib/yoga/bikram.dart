import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/widgets/module_widget_yoga.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_yoga.dart';
import 'package:pbl_fitness_app/data/yoga_data.dart';
import 'package:pbl_fitness_app/models/yoga.dart';

class BikramScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4B45B2),
        foregroundColor: Colors.white,
        title: Text(
          'Bikram Yoga',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            // STANDING SERIES
            // ModuleWidget(null,'Deep Breathing (Pranayama)',''),
            // SizedBox(height: 8,),

            // ModuleWidget(null,'Half Moon with Hands to Feet Pose (Ardha-Chandrasana with Padahastasana)',''),
            // SizedBox(height: 8,),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm1',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm1'),
              ),
              'Awkward Pose (Utkatasana)',
              'assets/images/yoga/bikram/awkward.jpg',
              'Utkatasana',
            ),
            SizedBox(height: 8),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm2',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm2'),
              ),
              'Eagle Pose | Garurasana',
              'assets/images/yoga/bikram/eagle.jpg',
              'Garurasana',
            ),
            SizedBox(height: 8),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm3',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm3'),
              ),
              'Standing Head to Knee Pose | Dandayamana-Janushirasana',
              'assets/images/yoga/bikram/standing_head.jpg',
              'Dandayamana-Janushirasana',
            ),
            SizedBox(height: 8),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm4',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm4'),
              ),
              'Standing Bow Pose | Dandayamana-Dhanurasana',
              'assets/images/yoga/bikram/standing_bow.jpg',
              'Dandayamana-Dhanurasana',
            ),
            SizedBox(height: 8),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm5',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm5'),
              ),
              'Balancing Stick Pose | Tuladandasana',
              'assets/images/yoga/bikram/stick.jpg',
              'Tuladandasana',
            ),
            SizedBox(height: 8),

            // ModuleWidget(null,'Standing Separae leg Stretching Pose | Dandayamana-Bibhaktapada-Paschimotthanasana',''),
            // SizedBox(height: 8,),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm6',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm6'),
              ),
              'Triangle Pose | Trikonasana',
              'assets/images/yoga/bikram/trikon.jpg',
              'Trikonasana',
            ),
            SizedBox(height: 8),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm7',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm7'),
              ),
              'Tree Pose | Tadasana',
              'assets/images/yoga/bikram/tree.jpg',
              'Tadasana',
            ),
            SizedBox(height: 8),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm8',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm8'),
              ),
              'Toe Stand Pose | Padangustasana',
              'assets/images/yoga/bikram/toe.jpg',
              'Padangustasana',
            ),
            SizedBox(height: 8),

            // FLOOR SERIES

            // ModuleWidget(null,'Locust Pose | Salabhasana',''),
            // SizedBox(height: 8,),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm9',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm9'),
              ),
              'Full Locust Pose | Poorna-Salabhasana',
              'assets/images/yoga/bikram/full_locust.jpg',
              'Poorna-Salabhasana',
            ),
            SizedBox(height: 8),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm10',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm10'),
              ),
              'Bow Pose | Dhanurasana',
              'assets/images/yoga/bikram/dhanu.jpg',
              'Dhanurasana',
            ),
            SizedBox(height: 8),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm11',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm11'),
              ),
              'Fixed Firm Pose | Supta-Vajrasana',
              'assets/images/yoga/bikram/fixed.jpg',
              'Supta-Vajrasana',
            ),
            SizedBox(height: 8),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm12',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm12'),
              ),
              'Half Tortoise Pose| Ardha-Kurmasana',
              'assets/images/yoga/bikram/tortoise.jpg',
              'Ardha-Kurmasana',
            ),
            SizedBox(height: 8),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm13',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm13'),
              ),
              'Camel Pose | Ustrasana',
              'assets/images/yoga/bikram/camel.jpg',
              'Ustrasana',
            ),
            SizedBox(height: 8),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm14',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm14'),
              ),
              'Rabbit Pose | Sasangasana',
              'assets/images/yoga/bikram/rabbit.jpg',
              'Sasangasana',
            ),
            SizedBox(height: 8),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm15',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm15'),
              ),
              'Spine Twisting Pose | Ardha-Matsyendrasana',
              'assets/images/yoga/bikram/spine.jpg',
              'Ardha-Matsyendrasana',
            ),
            SizedBox(height: 8),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm16',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm16'),
              ),
              'Blowing in Firm | Kapalbhati in Vajrasana',
              'assets/images/yoga/bikram/blow_firm.jpg',
              'Kapalbhati in Vajrasana',
            ),
            SizedBox(height: 8),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm17',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm17'),
              ),
              'Dead Body Pose | Savasana',
              'assets/images/yoga/bikram/savasana.jpg',
              'Savasana',
            ),
            SizedBox(height: 8),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm18',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm18'),
              ),
              'Wind Removing Pose | Pavanamuktasana',
              'assets/images/yoga/bikram/wind.jpg',
              'Pavanamuktasana',
            ),
            SizedBox(height: 8),

            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'bkm19',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'bkm19'),
              ),
              'Cobra | Bhujangasana',
              'assets/images/yoga/bikram/cobra.jpg',
              'Bhujangasana',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
