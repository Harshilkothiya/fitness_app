import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/widgets/module_widget_cardio.dart';
import 'package:pbl_fitness_app/widgets/sub_module_widget_cardio.dart';
import '../data/hiit_data.dart';

class HIITScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4B45B2),
        foregroundColor: Colors.white,
        title: Text(
          'HIIT',
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
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: hiitData
            .map((exercise) => Column(
                  children: [
                    ModuleWidgetCardio(
                      SubModuleWidgetCardio(
                        exercise.id,
                        exercise: exercise,
                      ),
                      exercise.title,
                      exercise.imageUrl,
                    ),
                    SizedBox(height: 8),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
