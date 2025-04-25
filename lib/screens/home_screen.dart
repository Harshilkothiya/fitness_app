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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
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
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6C63FF),
              Color(0xFF4B45B2),
            ],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                floating: false,
                pinned: true,
                snap: false,
                backgroundColor: Color(0xFF6C63FF),
                elevation: 0,
                stretch: true,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  title: Text(
                    'Welcome, ${user?.name ?? "John Doe"}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: ShaderMask(
                    shaderCallback: (rect) => LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height)),
                    blendMode: BlendMode.dstIn,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/images/gym/gym.jpg',
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.4),
                                Colors.transparent,
                                Color(0xFF6C63FF).withOpacity(0.8),
                              ],
                              stops: [0.0, 0.5, 1.0],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  stretchModes: [
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Quick Actions',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 140,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildQuickActionCard(
                            icon: Icons.directions_run,
                            title: 'Start\nWorkout',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      WorkoutSelectionScreen()),
                            ),
                          ),
                          _buildQuickActionCard(
                            icon: Icons.timer,
                            title: 'Track\nProgress',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CardioScreen()),
                            ),
                          ),
                          _buildQuickActionCard(
                            icon: Icons.person,
                            title: 'Profile',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    _buildSectionTitle('Your Progress'),
                    SizedBox(height: 16),
                    _buildProgressSection(),
                    SizedBox(height: 24),
                    _buildSectionTitle('Recommended Workouts'),
                    SizedBox(height: 16),
                    _buildWorkoutsList(),
                  ],
                ),
              ),
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

  Widget _buildSectionTitle(String title) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          Colors.white,
          Color(0xFFE0E0FF),
        ],
      ).createShader(bounds),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 32,
                  ),
                  SizedBox(height: 12),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressSection() {
    return Container(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildProgressCard(
            title: 'Calories',
            value: '350',
            unit: 'kcal',
            icon: Icons.local_fire_department,
            color: Color(0xFF7C74FF),
          ),
          _buildProgressCard(
            title: 'Steps',
            value: '8,439',
            unit: 'steps',
            icon: Icons.directions_walk,
            color: Color(0xFF5B54D4),
          ),
          _buildProgressCard(
            title: 'Time',
            value: '45',
            unit: 'min',
            icon: Icons.timer,
            color: Color(0xFF4B45B2),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard({
    required String title,
    required String value,
    required String unit,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 32),
            Spacer(),
            Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 4),
                Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text(
                    unit,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutsList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildWorkoutCard(
            title: 'Full Body Workout',
            duration: '45 min',
            intensity: 'Medium',
            image: 'https://images.unsplash.com/photo-1549060279-7e168fcee0c2',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WorkoutSelectionScreen()),
            ),
          ),
          SizedBox(height: 16),
          _buildWorkoutCard(
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
          SizedBox(height: 16),
          _buildWorkoutCard(
            title: 'Yoga Flow',
            duration: '60 min',
            intensity: 'Low',
            image: 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => YogaScreen()),
            ),
          ),
          SizedBox(height: 32), // Add bottom padding
        ],
      ),
    );
  }

  Widget _buildWorkoutCard({
    required String title,
    required String duration,
    required String intensity,
    required String image,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
              Positioned.fill(
                child: Image.network(
              image,
              fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
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
                    Colors.black.withOpacity(0.7),
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
                        fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    SizedBox(height: 8),
                        Row(
                          children: [
                        Icon(
                          Icons.timer,
                          color: Colors.white,
                          size: 16,
                        ),
                                  SizedBox(width: 4),
                                  Text(
                                    duration,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                        SizedBox(width: 16),
                        Icon(
                          Icons.fitness_center,
                          color: Colors.white,
                          size: 16,
                        ),
                                  SizedBox(width: 4),
                                  Text(
                                    intensity,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
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
