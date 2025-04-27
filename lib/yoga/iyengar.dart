import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/widgets/module_widget_yoga.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_yoga.dart';
import 'package:pbl_fitness_app/data/yoga_data.dart';
import 'package:pbl_fitness_app/models/yoga.dart';

class IyengarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4B45B2),
        foregroundColor: Colors.white,
        title: Text(
          'Iyengar Yoga',
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
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'i1',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'i1'),
              ),
              'Parsvakonasana',
              'assets/images/yoga/iyengar/parsva.jpg',
              'Parsvakonasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'i2',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'i2'),
              ),
              'Ardha Chandrasana',
              'assets/images/yoga/iyengar/ardha.jpg',
              'Ardha Chandrasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'i3',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'i3'),
              ),
              'Parivrtta Ardha Chandrasana',
              'assets/images/yoga/iyengar/pari_ardha.jpg',
              'Parivrtta Ardha Chandrasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'i4',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'i4'),
              ),
              'Parivrtta Trikonasana',
              'assets/images/yoga/iyengar/pari_trikon.jpg',
              'Parivrtta Trikonasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'i5',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'i5'),
              ),
              'Parivrtta Parsvakonasana',
              'assets/images/yoga/iyengar/pari_parsva.jpg',
              'Parivrtta Parsvakonasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'i6',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'i6'),
              ),
              'Virabhadrasana I',
              'assets/images/yoga/iyengar/vi1.jpg',
              'Virabhadrasana I',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'i7',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'i7'),
              ),
              'Virabhadrasana II',
              'assets/images/yoga/iyengar/vi2.jpg',
              'Virabhadrasana II',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'i8',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'i8'),
              ),
              'Virabhadrasana III',
              'assets/images/yoga/iyengar/vi3.jpg',
              'Virabhadrasana III',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'i9',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'i9'),
              ),
              'Parsvottanasana',
              'assets/images/yoga/iyengar/parsvottan.jpg',
              'Parsvottanasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'i10',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'i10'),
              ),
              'Prasarita Padottanasana',
              'assets/images/yoga/iyengar/prasarita.jpg',
              'Prasarita Padottanasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'i11',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'i11'),
              ),
              'Salamba Sirsasana',
              'assets/images/yoga/iyengar/salamba.jpg',
              'Salamba Sirsasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'i12',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'i12'),
              ),
              'Setu Bandha Sarvangasana',
              'assets/images/yoga/iyengar/setu.jpg',
              'Setu Bandha Sarvangasana',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'i13',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'i13'),
              ),
              'Savasana',
              'assets/images/yoga/iyengar/sava.jpg',
              'Savasana',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
