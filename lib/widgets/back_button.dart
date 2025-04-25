import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/screens/home_screen.dart';

class BackButton extends StatelessWidget {
  // @required final Widget widget;
  // BackButton(this.widget);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Back'),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
