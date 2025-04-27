import 'package:flutter/material.dart';
import '../widgets/module_widget_yoga.dart';
import '../widgets/sub_module_widget_yoga.dart';
import '../data/yoga_data.dart';
import '../models/yoga.dart';

//TODO
class AshtangaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4B45B2),
        foregroundColor: Colors.white,
        title: Text(
          'Ashtanga Yoga',
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
                'a1',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'a1'),
              ),
              'Sun Salutation A',
              'assets/images/yoga/ashtanga/sun_a.jpg',
              'Surya Namaskar A',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'a2',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'a2'),
              ),
              'Sun Salutation B',
              'assets/images/yoga/ashtanga/sun_b.jpg',
              'Surya Namaskar B',
            ),
            SizedBox(height: 8),
            ModuleWidgetYoga(
              SubModuleWidgetYoga(
                'a3',
                pose: YOGA_DATA.firstWhere((pose) => pose.id == 'a3'),
              ),
              'Standing Sequence',
              'assets/images/yoga/ashtanga/standing.jpg',
              'Uttitha Sthiti',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
