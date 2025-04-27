import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pbl_fitness_app/widgets/module_widget.dart';
import 'package:pbl_fitness_app/yoga/acro.dart';
import 'package:pbl_fitness_app/yoga/aerial.dart';
import 'package:pbl_fitness_app/yoga/ashtanga.dart';
import 'package:pbl_fitness_app/yoga/bikram.dart';
import 'package:pbl_fitness_app/yoga/hatha.dart';
import 'package:pbl_fitness_app/yoga/iyengar.dart';
import 'package:pbl_fitness_app/yoga/jivmukti.dart';
import 'package:pbl_fitness_app/yoga/kundalini.dart';
import 'package:pbl_fitness_app/yoga/prental.dart';
import 'package:pbl_fitness_app/yoga/restorative.dart';
import 'package:pbl_fitness_app/yoga/siva.dart';
import 'package:pbl_fitness_app/yoga/surya_namaskara.dart';
import 'package:pbl_fitness_app/yoga/vinyasa.dart';
import 'package:pbl_fitness_app/yoga/yin.dart';

class YogaScreen extends StatelessWidget {
  final List<Map<String, dynamic>> yogaStyles = [
    {
      'screen': VinyasaScreen(),
      'title': 'Vinyasa Yoga',
      'subtitle': 'Flowing postures',
      'image': 'assets/images/yoga/vinyasa.jpg',
    },
    {
      'screen': HathaScreen(),
      'title': 'Hatha Yoga',
      'subtitle': 'Balance & breath',
      'image': 'assets/images/yoga/hatha.jpg',
    },
    {
      'screen': AshtangaScreen(),
      'title': 'Ashtanga Yoga',
      'subtitle': 'Dynamic sequences',
      'image': 'assets/images/yoga/ashtanga.jpg',
    },
    {
      'screen': BikramScreen(),
      'title': 'Bikram Yoga',
      'subtitle': 'Hot yoga',
      'image': 'assets/images/yoga/bikram.jpg',
    },
    {
      'screen': IyengarScreen(),
      'title': 'Iyengar Yoga',
      'subtitle': 'Alignment focus',
      'image': 'assets/images/yoga/iyengar.jpg',
    },
    {
      'screen': RestorativeScreen(),
      'title': 'Restorative Yoga',
      'subtitle': 'Gentle & relaxing',
      'image': 'assets/images/yoga/restorative.jpg',
    },
    {
      'screen': YinScreen(),
      'title': 'Yin Yoga',
      'subtitle': 'Deep stretches',
      'image': 'assets/images/yoga/yin/yin.jpg',
    },
    {
      'screen': JivmuktiScreen(),
      'title': 'Jivmukti Yoga',
      'subtitle': 'Spiritual practice',
      'image': 'assets/images/yoga/jivmukti.jpg',
    },
    {
      'screen': PrentalScreen(),
      'title': 'Prenatal Yoga',
      'subtitle': 'For pregnancy',
      'image': 'assets/images/yoga/prental.jpg',
    },
    {
      'screen': AcroScreen(),
      'title': 'Acro Yoga',
      'subtitle': 'Partner balancing',
      'image': 'assets/images/yoga/acro/acro.jpg',
    },
    {
      'screen': AerialScreen(),
      'title': 'Aerial Yoga',
      'subtitle': 'Yoga in the air',
      'image': 'assets/images/yoga/aerial/aerial.jpg',
    },
    {
      'screen': KundaliniScreen(),
      'title': 'Kundalini Yoga',
      'subtitle': 'Energy awakening',
      'image': 'assets/images/yoga/kundalini.jpg',
    },
    {
      'screen': SivaScreen(),
      'title': 'Sivananda Yoga',
      'subtitle': 'Classical yoga',
      'image': 'assets/images/yoga/siva/sivananda.jpg',
    },
    {
      'screen': SuryaNamaskaraScreen(),
      'title': 'Surya Namaskara',
      'subtitle': 'Sun Salutation',
      'image': 'assets/images/yoga/surya/sn.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Yoga Practices',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          itemCount: yogaStyles.length,
          itemBuilder: (context, index) {
            final style = yogaStyles[index];
            return ModuleWidget(
              style['screen'],
              style['title'],
              style['image'],
              subtitle: style['subtitle'],
            );
          },
        ),
      ),
    );
  }
}
