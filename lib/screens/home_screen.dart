import 'package:flutter/material.dart';
import 'package:pbl_fitness_app/models/exercise.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../theme/app_theme.dart';
import 'profile_screen.dart';
import 'workout_selection_screen.dart';
import 'cardio_screen.dart';
import 'yoga_screen.dart';
import 'health_tips.dart';
import 'workout_detail_screen.dart';
import 'diet_screen.dart';
import 'track_progress_screen.dart';
import '../providers/progress_provider.dart';

// Add a global RouteObserver
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, RouteAware {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  int _selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    // Called when coming back to this screen
    setState(() {
      _selectedIndex = 0;
    });
  }

  void _onBottomNavTap(int index) {
    setState(() => _selectedIndex = index);
    Widget targetScreen;
    switch (index) {
      case 0:
        // Already on home
        return;
      case 1:
        targetScreen = WorkoutSelectionScreen();
        break;
      case 2:
        targetScreen = DietScreen();
        break;
      case 3:
        targetScreen = ProfileScreen();
        break;
      case 4:
        targetScreen = HealthTipsScreen();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => targetScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOutCubic;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.currentUser;
    final progress = Provider.of<ProgressProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Card
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Row(
                    children: [
                      Icon(Icons.waving_hand,
                          color: Color(0xFF1976D2), size: 32),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                    'Welcome, ${user?.name ?? "John Doe"}',
                    style: TextStyle(
                            fontSize: 22,
                      fontWeight: FontWeight.bold,
                            color: Color(0xFF222B45),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
              // Quick Actions
              Text(
                        'Quick Actions',
                        style: TextStyle(
                  fontSize: 20,
                          fontWeight: FontWeight.bold,
                  color: Color(0xFF222B45),
                      ),
                    ),
              SizedBox(height: 12),
              Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                  _modernQuickActionCard(
                            icon: Icons.directions_run,
                    color: Color(0xFF1976D2),
                    title: 'Start Workout',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                          builder: (context) => WorkoutSelectionScreen()),
                            ),
                          ),
                  _modernQuickActionCard(
                            icon: Icons.timer,
                    color: Color(0xFFFF9800),
                    title: 'Track Progress',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                          builder: (context) => TrackProgressScreen()),
                            ),
                          ),
                  _modernQuickActionCard(
                            icon: Icons.person,
                    color: Color(0xFF43A047),
                            title: 'Profile',
                            onTap: () => Navigator.push(
                              context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                            ),
                          ),
                        ],
                      ),
              SizedBox(height: 28),
              // Progress Section
              Text(
                'Your Progress',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF222B45),
                ),
              ),
              SizedBox(height: 12),
              SizedBox(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _modernProgressCard(
                      icon: Icons.local_fire_department,
                      color: Color(0xFFFF9800),
                      title: 'Calories',
                      value: progress.totalCalories.toStringAsFixed(0),
                      unit: 'kcal',
                    ),
                    _modernProgressCard(
                      icon: Icons.directions_walk,
                      color: Color(0xFF1976D2),
                      title: 'Steps',
                      value: '8,439',
                      unit: 'steps',
                    ),
                    _modernProgressCard(
                      icon: Icons.timer,
                      color: Color(0xFF43A047),
                      title: 'Time',
                      value: (progress.totalTime ~/ 60).toString(),
                      unit: 'min',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28),
              // Recommended Workouts
              Text(
                'Recommended Workouts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF222B45),
                ),
              ),
              SizedBox(height: 12),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _modernWorkoutCard(
                      title: 'Full Body Workout',
                      duration: '45 min',
                      intensity: 'Medium',
                      image:
                          'https://images.unsplash.com/photo-1549060279-7e168fcee0c2',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WorkoutSelectionScreen()),
                      ),
                    ),
                    _modernWorkoutCard(
                      title: 'HIIT Training',
                      duration: '30 min',
                      intensity: 'High',
                      image:
                          'https://images.unsplash.com/photo-1434596922112-19c563067271',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CardioScreen()),
                      ),
                    ),
                    _modernWorkoutCard(
                      title: 'Yoga Flow',
                      duration: '60 min',
                      intensity: 'Low',
                      image:
                          'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => YogaScreen()),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(0, Icons.grid_view_outlined, 'Home'),
            _buildNavItem(1, Icons.fitness_center_outlined, 'Workout'),
            _buildNavItem(2, Icons.restaurant_menu_outlined, 'Diet'),
            _buildNavItem(3, Icons.person_outline, 'Profile'),
            _buildNavItem(4, Icons.health_and_safety_outlined, 'Tips'),
          ],
        ),
      ),
    );
  }

  Widget _modernQuickActionCard({
    required IconData icon,
    required Color color,
    required String title,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
            onTap: onTap,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
            child: Padding(
            padding: EdgeInsets.symmetric(vertical: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Icon(icon, color: color, size: 28),
                  ),
                SizedBox(height: 14),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Color(0xFF222B45),
                    fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _modernProgressCard({
    required IconData icon,
    required Color color,
    required String title,
    required String value,
    required String unit,
  }) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 16),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Container(
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(8),
                child: Icon(icon, color: color, size: 22),
              ),
              SizedBox(height: 18),
            Text(
              title,
              style: TextStyle(
                  color: Color(0xFF6E7582),
                  fontSize: 14,
              ),
            ),
            SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: TextStyle(
                      color: Color(0xFF222B45),
                      fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 4),
                Padding(
                    padding: EdgeInsets.only(bottom: 2),
                  child: Text(
                    unit,
                    style: TextStyle(
                        color: Color(0xFF6E7582),
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
                ),
              SizedBox(height: 4),
              ],
            ),
        ),
      ),
    );
  }

  Widget _modernWorkoutCard({
    required String title,
    required String duration,
    required String intensity,
    required String image,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        margin: EdgeInsets.only(right: 16),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
              Positioned.fill(
                child: Image.network(
              image,
              fit: BoxFit.cover,
                ),
            ),
              Positioned.fill(
                child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                  colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.55),
                  ],
                ),
              ),
            ),
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                        fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    SizedBox(height: 8),
                        Row(
                          children: [
                        Icon(Icons.timer, color: Colors.white, size: 15),
                                  SizedBox(width: 4),
                                  Text(
                                    duration,
                                    style: TextStyle(
                                      color: Colors.white,
                            fontSize: 13,
                                  ),
                        ),
                        SizedBox(width: 12),
                        Icon(Icons.fitness_center,
                            color: Colors.white, size: 15),
                                  SizedBox(width: 4),
                                  Text(
                                    intensity,
                                    style: TextStyle(
                                      color: Colors.white,
                            fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () => _onBottomNavTap(index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6),
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? Color(0xFF6C63FF) : Colors.grey[400],
                size: 22,
              ),
              SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Color(0xFF6C63FF) : Colors.grey[400],
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
