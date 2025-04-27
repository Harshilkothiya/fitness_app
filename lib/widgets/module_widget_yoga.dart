import 'package:flutter/material.dart';
import 'sub_module_widget_yoga.dart';

class ModuleWidgetYoga extends StatelessWidget {
  final Widget child;
  final String title;
  final String imageUrl;
  final String sanskritName;
  final String? duration;
  final String? difficulty;

  ModuleWidgetYoga(
    this.child,
    this.title,
    this.imageUrl,
    this.sanskritName, {
    this.duration,
    this.difficulty,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(18),
        clipBehavior: Clip.antiAlias,
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => child),
            );
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Hero(
                  tag: 'yoga_${(child as SubModuleWidgetYoga).id}',
                  child: Image.asset(
                    imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 180,
                        color: Colors.grey[200],
                        child: Icon(
                          Icons.self_improvement,
                          size: 48,
                          color: Colors.grey[400],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(18),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(16, 18, 16, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                          letterSpacing: 0.2,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        sanskritName,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      if (duration != null || difficulty != null) ...[
                        SizedBox(height: 10),
                        Row(
                          children: [
                            if (duration != null) ...[
                              Icon(Icons.access_time,
                                  color: Colors.white, size: 18),
                              SizedBox(width: 4),
                              Text(
                                duration!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                            if (duration != null && difficulty != null)
                              SizedBox(width: 16),
                            if (difficulty != null) ...[
                              Icon(Icons.fitness_center,
                                  color: Colors.white, size: 18),
                              SizedBox(width: 4),
                              Text(
                                difficulty!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
