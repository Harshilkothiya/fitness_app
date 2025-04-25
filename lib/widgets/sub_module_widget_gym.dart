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
      backgroundColor: Color(0xFF1C1B1E),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Large Image Header with Back Button and Exercise Name
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            backgroundColor: Colors.transparent,
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
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(
                widget.exercise.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
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
                      Row(
                        children: [
                          Expanded(
                            child: _buildInfoCard(
                              'Difficulty',
                              widget.exercise.difficulty,
                              Icons.fitness_center,
                              Colors.orange,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: _buildInfoCard(
                              'Equipment',
                              widget.exercise.equipment as String,
                              Icons.sports_gymnastics,
                              Colors.blue,
                            ),
                          ),
                        ],
                      ),

                      // Timer or Reps Section
                      if (widget.exercise.time != null ||
                          widget.exercise.repetitions != null) ...[
                        SizedBox(height: 16),
                        Row(
                          children: [
                            if (widget.exercise.time != null)
                              Expanded(
                                child: _buildTimerCard(),
                              ),
                            if (widget.exercise.time != null &&
                                widget.exercise.repetitions != null)
                              SizedBox(width: 16),
                            if (widget.exercise.repetitions != null)
                              Expanded(
                                child: _buildInfoCard(
                                  'Reps',
                                  '${widget.exercise.repetitions}',
                                  Icons.repeat,
                                  Colors.purple,
                                ),
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
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.exercise.description.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 6),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Text(
                                      widget.exercise.description[index],
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
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
                            color: Colors.white,
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
                                          color: Colors.white,
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
                            color: Colors.white,
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
                                          color: Colors.white,
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
    return Container(
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
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  content,
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
