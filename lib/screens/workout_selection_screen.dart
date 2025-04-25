import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'gym_screen.dart';
import 'cardio_screen.dart';
import 'yoga_screen.dart';
import 'hiit_screen.dart';

class WorkoutSelectionScreen extends StatelessWidget {
  final List<WorkoutCategory> categories = [
    WorkoutCategory(
      title: 'Gym Workouts',
      description: 'Build strength and muscle with equipment',
      icon: Icons.fitness_center,
      color: AppTheme.workoutColors['gym']!,
      screen: GymScreen(),
    ),
    WorkoutCategory(
      title: 'Cardio',
      description: 'Improve endurance and burn calories',
      icon: Icons.directions_run,
      color: AppTheme.workoutColors['cardio']!,
      screen: CardioScreen(),
    ),
    WorkoutCategory(
      title: 'Yoga',
      description: 'Enhance flexibility and mindfulness',
      icon: Icons.self_improvement,
      color: AppTheme.workoutColors['yoga']!,
      screen: YogaScreen(),
    ),
    WorkoutCategory(
      title: 'HIIT',
      description: 'High-intensity interval training',
      icon: Icons.timer,
      color: AppTheme.workoutColors['hiit']!,
      screen: HIITScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              backgroundColor: AppTheme.primaryColor,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Workouts',
                  style: AppTheme.headingMedium
                      .copyWith(color: AppTheme.textLight),
                ),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: AppTheme.primaryGradient,
                    ),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        'https://images.unsplash.com/photo-1534438327276-14e5300c3a48',
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              AppTheme.primaryColor.withOpacity(0.8),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final category = categories[index];
                    return _buildWorkoutCard(context, category);
                  },
                  childCount: categories.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutCard(BuildContext context, WorkoutCategory category) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => category.screen),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.cardLight,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: category.color.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: category.color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                category.icon,
                size: 32,
                color: category.color,
              ),
            ),
            SizedBox(height: 16),
            Text(
              category.title,
              style: AppTheme.bodyLarge.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                category.description,
                style: AppTheme.bodyMedium,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutCategory {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final Widget screen;

  WorkoutCategory({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.screen,
  });
}
