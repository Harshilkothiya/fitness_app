import 'package:flutter/material.dart';
import '../models/gym.dart';

class SubModuleWidgetGym extends StatefulWidget {
  final String id;
  final Gym exercise;

  SubModuleWidgetGym(this.id, {required this.exercise});

  @override
  _SubModuleWidgetGymState createState() => _SubModuleWidgetGymState();
}

class _SubModuleWidgetGymState extends State<SubModuleWidgetGym>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isTimerActive = false;
  int _remainingTime = 0;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.5, curve: Curves.easeOut),
    ));

    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.2, 1.0, curve: Curves.easeOut),
    ));

    if (widget.exercise.time != null) {
      _remainingTime = widget.exercise.time!;
    }

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _startTimer() {
    if (!_isTimerActive && widget.exercise.time != null) {
      setState(() {
        _isTimerActive = true;
        _remainingTime = widget.exercise.time!;
      });

      Future.doWhile(() async {
        await Future.delayed(Duration(seconds: 1));
        if (!mounted) return false;

        setState(() {
          if (_remainingTime > 0) {
            _remainingTime--;
          } else {
            _isTimerActive = false;
          }
        });

        return _isTimerActive && _remainingTime > 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Large Image Header with Back Button and Exercise Name
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    widget.exercise.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.white.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(
                widget.exercise.title,
                style: TextStyle(
                  color: Color(0xFF222B45),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xFF1976D2)),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),

          // Exercise Content
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Exercise Info Cards
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          _buildInfoCard(
                            'Difficulty',
                            (widget.exercise.difficulty.isNotEmpty ? widget.exercise.difficulty : 'N/A'),
                            Icons.fitness_center,
                            Color(0xFFFF9800),
                          ),
                          _buildInfoCard(
                            'Equipment',
                            (widget.exercise.equipment.isNotEmpty ? widget.exercise.equipment.join(', ') : 'None'),
                            Icons.sports_gymnastics,
                            Color(0xFF1976D2),
                          ),
                        ],
                      ),

                      // Timer or Reps Section
                      if (widget.exercise.time != null ||
                          widget.exercise.repetitions != null) ...[
                        SizedBox(height: 16),
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            if (widget.exercise.time != null)
                              _buildInfoCard(
                                'Timer',
                                widget.exercise.time != null ? '${widget.exercise.time}s' : 'N/A',
                                Icons.timer,
                                Color(0xFFD32F2F),
                              ),
                            if (widget.exercise.repetitions != null)
                              _buildInfoCard(
                                'Reps',
                                widget.exercise.repetitions != null ? '${widget.exercise.repetitions}' : 'N/A',
                                Icons.repeat,
                                Color(0xFF1976D2),
                              ),
                          ],
                        ),
                      ],

                      // Instructions Section
                      SizedBox(height: 32),
                      Text(
                        'Instructions',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF222B45),
                        ),
                      ),
                      SizedBox(height: 16),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              widget.exercise.description.length,
                              (index) => Padding(
                                padding: EdgeInsets.only(bottom: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Icon(
                                        Icons.circle,
                                        size: 10,
                                        color: Color(0xFF1976D2),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        widget.exercise.description[index],
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF6E7582),
                                          height: 1.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Tips Section
                      if (widget.exercise.tips != null) ...[
                        SizedBox(height: 32),
                        Text(
                          'Tips',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF222B45),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.exercise.tips!.map((tip) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.tips_and_updates,
                                      color: Colors.amber,
                                      size: 24,
                                    ),
                                    SizedBox(width: 16),
                                    Expanded(
                                      child: Text(
                                        tip,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF6E7582),
                                          height: 1.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],

                      // Variations Section
                      if (widget.exercise.variations != null) ...[
                        SizedBox(height: 32),
                        Text(
                          'Variations',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF222B45),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                widget.exercise.variations!.map((variation) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.change_circle,
                                      color: Colors.green,
                                      size: 24,
                                    ),
                                    SizedBox(width: 16),
                                    Expanded(
                                      child: Text(
                                        variation,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF6E7582),
                                          height: 1.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
      String title, String content, IconData icon, Color color) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(icon, color: color, size: 26),
              ),
            ),
            SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF6E7582),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6E7582),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimerCard() {
    return GestureDetector(
      onTap: _startTimer,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _isTimerActive ? Icons.timer : Icons.timer_off,
                color: Colors.red,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Timer',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${_remainingTime}s',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
