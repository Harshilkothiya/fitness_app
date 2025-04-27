import 'package:flutter/material.dart';

class HealthTip {
  final String title;
  final String description;
  final String category;
  final IconData icon;
  final List<String> bulletPoints;

  HealthTip({
    required this.title,
    required this.description,
    required this.category,
    required this.icon,
    required this.bulletPoints,
  });
}

class HealthTipsScreen extends StatefulWidget {
  @override
  _HealthTipsScreenState createState() => _HealthTipsScreenState();
}

class _HealthTipsScreenState extends State<HealthTipsScreen> {
  final List<HealthTip> healthTips = [
    HealthTip(
      title: 'Nutrition Basics',
      description: 'Essential nutrition tips for a healthy lifestyle',
      category: 'Nutrition',
      icon: Icons.restaurant_menu,
      bulletPoints: [
        'Eat a variety of colorful fruits and vegetables',
        'Include protein in every meal',
        'Stay hydrated with 8 glasses of water daily',
        'Limit processed foods and added sugars',
        'Choose whole grains over refined grains',
      ],
    ),
    HealthTip(
      title: 'Sleep Better',
      description: 'Improve your sleep quality for better health',
      category: 'Wellness',
      icon: Icons.nightlight_round,
      bulletPoints: [
        'Maintain a consistent sleep schedule',
        'Create a relaxing bedtime routine',
        'Avoid screens before bedtime',
        'Keep your bedroom cool and dark',
        'Aim for 7-9 hours of sleep',
      ],
    ),
    HealthTip(
      title: 'Stress Management',
      description: 'Effective ways to manage daily stress',
      category: 'Mental Health',
      icon: Icons.spa,
      bulletPoints: [
        'Practice daily meditation',
        'Take regular breaks during work',
        'Exercise regularly',
        'Maintain a journal',
        'Connect with loved ones',
      ],
    ),
    HealthTip(
      title: 'Exercise Fundamentals',
      description: 'Basic principles for effective workouts',
      category: 'Fitness',
      icon: Icons.fitness_center,
      bulletPoints: [
        'Warm up before exercising',
        'Mix cardio and strength training',
        'Listen to your body',
        'Stay consistent with workouts',
        'Cool down and stretch after exercise',
      ],
    ),
  ];

  String selectedCategory = 'All';

  List<String> get categories {
    final Set<String> uniqueCategories = {'All'};
    uniqueCategories.addAll(healthTips.map((tip) => tip.category));
    return uniqueCategories.toList();
  }

  List<HealthTip> get filteredTips {
    if (selectedCategory == 'All') return healthTips;
    return healthTips.where((tip) => tip.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Health Tips',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF6C63FF),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6C63FF), Color(0xFF4B45B2)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildCategoryFilter(),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: filteredTips.length,
                  itemBuilder: (context, index) {
                    return _buildTipCard(filteredTips[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = category;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 12),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color:
                    isSelected ? Colors.white : Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(
                    color: isSelected ? Color(0xFF6C63FF) : Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTipCard(HealthTip tip) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ExpansionTile(
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFF6C63FF).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(tip.icon, color: Color(0xFF6C63FF)),
        ),
        title: Text(
          tip.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          tip.description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: tip.bulletPoints
                  .map((point) => Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.fiber_manual_record,
                                size: 8, color: Color(0xFF6C63FF)),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                point,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
