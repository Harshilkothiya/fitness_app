import 'package:flutter/material.dart';
import 'sub_module_widget_cardio.dart';

class ModuleWidgetCardio extends StatelessWidget {
  final Widget child;
  final String title;
  final String imageUrl;

  ModuleWidgetCardio(this.child, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => child),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Hero(
                tag: 'exercise_${(child as SubModuleWidgetCardio).id}',
                child: Image.asset(
                  imageUrl,
                  height: 160,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 160,
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.fitness_center,
                        size: 50,
                        color: Colors.grey[400],
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
