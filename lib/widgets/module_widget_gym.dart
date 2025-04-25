import 'package:flutter/material.dart';

class ModuleWidgetGym extends StatelessWidget {
  final String title;
  final String imagePath;
  final List<String> tags;
  final VoidCallback onTap;

  ModuleWidgetGym({
    required this.title,
    required this.imagePath,
    required this.tags,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Icon(
                Icons.fitness_center,
                size: 16,
                color: Colors.purple[300],
              ),
              SizedBox(width: 4),
              Text(
                tags[0], // Muscle group (e.g., "Shoulder")
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 12),
              Icon(
                Icons.sports_gymnastics,
                size: 16,
                color: Colors.blue[300],
              ),
              SizedBox(width: 4),
              Text(
                tags.length > 1 ? tags[1].split(',')[0].trim() : '', // Equipment (e.g., "Barbell")
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.grey[400],
          size: 24,
        ),
      ),
    );
  }
}
