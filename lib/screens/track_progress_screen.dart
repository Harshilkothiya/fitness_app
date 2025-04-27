import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/gym_data.dart';
import '../data/yoga_data.dart';
import '../data/cardio_data.dart';
import '../data/hiit_data.dart';
import '../models/gym.dart';
import '../models/yoga_model.dart';
import '../models/cardio.dart';
import 'package:provider/provider.dart';
import '../providers/progress_provider.dart';

class TrackProgressScreen extends StatefulWidget {
  @override
  _TrackProgressScreenState createState() => _TrackProgressScreenState();
}

class _TrackProgressScreenState extends State<TrackProgressScreen> {
  final List<String> workoutTypes = [
    'Gym',
    'Yoga',
    'Cardio',
    'HIIT',
  ];

  final List<String> yogaSubcategories = [
    'Hatha',
    'Vinyasa',
    'Ashtanga',
    'Restorative',
  ];

  final Map<String, String> yogaSubcategoryImages = {
    'Hatha': 'assets/images/yoga/hatha/tadasana.png',
    'Vinyasa': 'assets/images/yoga/vinyasa/cat_cow.jpg',
    'Ashtanga': 'assets/images/yoga/ashtanga.jpg',
    'Restorative': 'assets/images/yoga/restorative/chair.jpg',
  };

  String? selectedType;
  String? selectedYogaSubcategory;
  int currentExercise = 0;
  bool started = false;
  bool completed = false;
  int timer = 0;
  int totalTime = 0;
  double totalCalories = 0;
  List<bool> exerciseCompleted = [];

  List<dynamic> get currentExercises {
    switch (selectedType) {
      case 'Gym':
        return gymData.take(5).toList();
      case 'Yoga':
        return YOGA_DATA.take(5).toList();
      case 'Cardio':
        return cardioData.take(5).toList();
      case 'HIIT':
        return hiitData.take(5).toList();
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Progress',
            style: TextStyle(color: AppTheme.textPrimary)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppTheme.primaryColor),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (selectedType == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Choose your workout type:',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary)),
          SizedBox(height: 24),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 18,
            crossAxisSpacing: 18,
            childAspectRatio: 1.2,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _typeCard('Gym', Icons.fitness_center, Colors.blue),
              _typeCard('Yoga', Icons.self_improvement, Colors.green),
              _typeCard('Cardio', Icons.directions_run, Colors.orange),
              _typeCard('HIIT', Icons.flash_on, Colors.purple),
            ],
          ),
        ],
      );
    }

    if (selectedType == 'Yoga' && selectedYogaSubcategory == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Choose your yoga style:',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary)),
          SizedBox(height: 24),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 18,
            crossAxisSpacing: 18,
            childAspectRatio: 1.0,
            physics: NeverScrollableScrollPhysics(),
            children: yogaSubcategories
                .map((subcategory) => _yogaTypeCard(
                      subcategory,
                      yogaSubcategoryImages[subcategory] ?? '',
                      Colors.green,
                      onTap: () {
                        setState(() {
                          selectedYogaSubcategory = subcategory;
                        });
                      },
                    ))
                .toList(),
          ),
        ],
      );
    }

    if (completed) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('🏁 Workout Complete!',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor)),
            SizedBox(height: 18),
            Text('Total Exercises: ${currentExercises.length}',
                style: TextStyle(fontSize: 18, color: AppTheme.textPrimary)),
            Text('Total Time: ${totalTime}s',
                style: TextStyle(fontSize: 18, color: AppTheme.textPrimary)),
            SizedBox(height: 24),
            Text('Amazing job! 💪',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.secondaryColor)),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedType = null;
                  completed = false;
                });
              },
              child: Text('Start Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ],
        ),
      );
    }

    final exercises = currentExercises;
    final exercise = exercises[currentExercise];
    final isLast = currentExercise == exercises.length - 1;
    final int duration = _getDuration(exercise);
    final String imageUrl = _getImageUrl(exercise);
    final String title = _getTitle(exercise);
    final List<String> description = _getDescription(exercise);
    final List<String> benefits = _getBenefits(exercise);
    final double calories = _estimateCalories(exercise, duration);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Exercise ${currentExercise + 1} of ${exercises.length}',
            style: TextStyle(fontSize: 18, color: AppTheme.textSecondary)),
        SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('Total Time',
                    style:
                        TextStyle(fontSize: 14, color: AppTheme.textSecondary)),
                Text('${totalTime + (started ? duration - timer : 0)} s',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor)),
              ],
            ),
            Column(
              children: [
                Text('Calories',
                    style:
                        TextStyle(fontSize: 14, color: AppTheme.textSecondary)),
                Text(
                    '${(totalCalories + (started ? calories * ((duration - timer) / duration) : 0)).toStringAsFixed(1)} kcal',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange)),
              ],
            ),
          ],
        ),
        SizedBox(height: 18),
        Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: imageUrl.isNotEmpty
                        ? _exerciseImage(imageUrl)
                        : SizedBox.shrink(),
                  ),
                  SizedBox(height: 16),
                  Text(title,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary)),
                  SizedBox(height: 10),
                  if (duration > 0)
                    Text('$duration seconds',
                        style: TextStyle(
                            fontSize: 16, color: AppTheme.textSecondary)),
                  SizedBox(height: 14),
                  ...description.take(3).map((step) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ',
                                style: TextStyle(color: AppTheme.primaryColor)),
                            Expanded(
                                child:
                                    Text(step, style: TextStyle(fontSize: 15))),
                          ],
                        ),
                      )),
                  if (benefits.isNotEmpty) ...[
                    SizedBox(height: 10),
                    Text('Benefits:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.secondaryColor)),
                    ...benefits.take(2).map((b) => Text('• $b',
                        style: TextStyle(
                            fontSize: 14, color: AppTheme.textSecondary))),
                  ],
                  SizedBox(height: 18),
                  if (!started)
                    ElevatedButton(
                      onPressed: () => _startExercise(duration),
                      child: Text('Start',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.secondaryColor,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                    ),
                  if (started && !exerciseCompleted[currentExercise])
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: _modernInlineTimerBar(duration, timer),
                    ),
                  if (exerciseCompleted.length > currentExercise &&
                      exerciseCompleted[currentExercise])
                    Column(
                      children: [
                        Text('✅ $title completed!',
                            style: TextStyle(
                                fontSize: 18,
                                color: AppTheme.secondaryColor,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 18),
                        if (!isLast)
                          ElevatedButton(
                            onPressed: () => _nextExercise(duration),
                            child: Text('Next Exercise',
                                style: TextStyle(fontSize: 16)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryColor,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 28, vertical: 12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                          ),
                        if (isLast)
                          ElevatedButton(
                            onPressed: () => _finishWorkout(duration),
                            child: Text('Finish Workout',
                                style: TextStyle(fontSize: 16)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryColor,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 28, vertical: 12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _typeCard(String type, IconData icon, Color color,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ??
          () {
            setState(() {
              selectedType = type;
              currentExercise = 0;
              started = false;
              completed = false;
              totalTime = 0;
              totalCalories = 0;
              exerciseCompleted = List.filled(currentExercises.length, false);
            });
          },
      child: Card(
        color: color.withOpacity(0.12),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 38),
              SizedBox(height: 12),
              Text(type,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _yogaTypeCard(String type, String imageAsset, Color color,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: color.withOpacity(0.10),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.18),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  imageAsset.isNotEmpty
                      ? imageAsset
                      : 'assets/images/yoga/yoga.jpg',
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 70,
                    width: 70,
                    color: Colors.grey[200],
                    child: Icon(Icons.image_not_supported,
                        size: 36, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 14),
              Text(type,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ),
      ),
    );
  }

  void _startExercise(int duration) {
    setState(() {
      started = true;
      timer = duration;
    });
    _runTimer(duration);
  }

  void _runTimer(int duration) async {
    for (int t = duration; t >= 0; t--) {
      await Future.delayed(Duration(seconds: 1));
      if (!mounted) return;
      setState(() {
        timer = t;
      });
      if (t == 0) {
        setState(() {
          started = false;
          if (exerciseCompleted.length > currentExercise) {
            exerciseCompleted[currentExercise] = true;
          }
        });
      }
    }
  }

  void _nextExercise(int duration) {
    setState(() {
      totalTime += duration;
      totalCalories +=
          _estimateCalories(currentExercises[currentExercise], duration);
      currentExercise++;
      started = false;
    });
    _updateProgressProvider();
  }

  void _finishWorkout(int duration) {
    setState(() {
      totalTime += duration;
      totalCalories +=
          _estimateCalories(currentExercises[currentExercise], duration);
      completed = true;
    });
    _updateProgressProvider();
  }

  int _getDuration(dynamic exercise) {
    if (exercise is Gym) {
      return exercise.time ?? 40;
    } else if (exercise is Yoga) {
      return 60;
    } else if (exercise is Cardio) {
      if (exercise.time != null) {
        final match = RegExp(r'(\d+)').firstMatch(exercise.time!);
        if (match != null) return int.parse(match.group(1)!);
      }
      return 40;
    }
    return 40;
  }

  String _getImageUrl(dynamic exercise) {
    if (exercise is Gym) return exercise.imageUrl;
    if (exercise is Yoga) return exercise.imageUrl;
    if (exercise is Cardio) return exercise.imageUrl;
    return '';
  }

  String _getTitle(dynamic exercise) {
    if (exercise is Gym) return exercise.title;
    if (exercise is Yoga) return exercise.title;
    if (exercise is Cardio) return exercise.title;
    return '';
  }

  List<String> _getDescription(dynamic exercise) {
    if (exercise is Gym) return exercise.description;
    if (exercise is Yoga) return exercise.description;
    if (exercise is Cardio) return exercise.description;
    return [];
  }

  List<String> _getBenefits(dynamic exercise) {
    if (exercise is Yoga) return exercise.benefits;
    if (exercise is Cardio && exercise.benefits != null)
      return exercise.benefits!;
    return [];
  }

  double _estimateCalories(dynamic exercise, int duration) {
    // If the model has calories, use it. Otherwise, estimate.
    if (exercise is Gym &&
        exercise.time != null &&
        exercise.repetitions != null) {
      return (duration / 60) * 8; // 8 kcal/min for gym
    } else if (exercise is Yoga) {
      return (duration / 60) * 4; // 4 kcal/min for yoga
    } else if (exercise is Cardio) {
      return (duration / 60) * 10; // 10 kcal/min for cardio/hiit
    }
    return (duration / 60) * 6; // fallback
  }

  void _updateProgressProvider() {
    final progress = Provider.of<ProgressProvider>(context, listen: false);
    progress.setProgress(totalTime, totalCalories);
  }

  Widget _exerciseImage(String imageUrl) {
    if (imageUrl.startsWith('assets/')) {
      return Image.asset(
        imageUrl,
        height: 160,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          height: 160,
          color: Colors.grey[200],
          child: Icon(Icons.image_not_supported, size: 48, color: Colors.grey),
        ),
      );
    } else if (imageUrl.startsWith('http')) {
      return Image.network(
        imageUrl,
        height: 160,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          height: 160,
          color: Colors.grey[200],
          child: Icon(Icons.image_not_supported, size: 48, color: Colors.grey),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget _modernInlineTimerBar(int duration, int timer) {
    final percent = (duration - timer) / duration;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.timer, color: AppTheme.primaryColor, size: 22),
        SizedBox(width: 6),
        Text(
          '$timer seconds left',
          style: TextStyle(
            fontSize: 18,
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 18),
        Expanded(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppTheme.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.08),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
              FractionallySizedBox(
                widthFactor: percent.clamp(0.0, 1.0),
                child: Container(
                  height: 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppTheme.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
