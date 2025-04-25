import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../models/gym.dart';
import '../data/exercises_data.dart';
import '../widgets/workout_timer.dart';

class WorkoutDetailScreen extends StatefulWidget {
  final String workoutName;
  final List<Exercise> exercises;

  const WorkoutDetailScreen({
    Key? key,
    required this.workoutName,
    required this.exercises,
    required String workoutDuration,
    required String workoutIntensity,
  }) : super(key: key);

  @override
  State<WorkoutDetailScreen> createState() => _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  int _currentExerciseIndex = 0;
  bool _isResting = false;
  int _restDuration = 60; // Default rest duration in seconds
  double _totalCaloriesBurned = 0.0;
  int _currentSet = 1;
  bool _isExerciseTimerRunning = false;

  void _nextExercise() {
    setState(() {
      if (_currentExerciseIndex < widget.exercises.length - 1) {
        _currentExerciseIndex++;
        _isResting = true;
        _currentSet = 1;
        _totalCaloriesBurned +=
            widget.exercises[_currentExerciseIndex - 1].totalCaloriesBurned;
      }
    });
  }

  void _previousExercise() {
    setState(() {
      if (_currentExerciseIndex > 0) {
        _currentExerciseIndex--;
        _isResting = true;
        _currentSet = 1;
        _totalCaloriesBurned -=
            widget.exercises[_currentExerciseIndex + 1].totalCaloriesBurned;
      }
    });
  }

  void _onRestComplete() {
    setState(() {
      _isResting = false;
      _isExerciseTimerRunning = true;
    });
  }

  void _onExerciseTimerComplete() {
    setState(() {
      if (_currentSet < currentExercise.sets) {
        _currentSet++;
        _isResting = true;
      } else {
        _isExerciseTimerRunning = false;
      }
    });
  }

  Exercise get currentExercise => widget.exercises[_currentExerciseIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.workoutName),
              background: Stack(
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
                          Colors.black.withOpacity(0.7),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildWorkoutInfo(),
                  const SizedBox(height: 24),
                  Text(
                    'Exercises',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final exercise = widget.exercises[index];
                return _buildExerciseCard(context, exercise, index);
              },
              childCount: widget.exercises.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress indicator
                  LinearProgressIndicator(
                    value:
                        (_currentExerciseIndex + 1) / widget.exercises.length,
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceVariant,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Exercise details
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Exercise ${_currentExerciseIndex + 1}/${widget.exercises.length}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            currentExercise.name,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Sets: ${currentExercise.sets}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Reps: ${currentExercise.reps}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          if (currentExercise.weight != null)
                            Text(
                              'Weight: ${currentExercise.weight} kg',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Calories burned display
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Calories Burned',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${_totalCaloriesBurned.toStringAsFixed(1)} kcal',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Exercise timer
                  if (_isExerciseTimerRunning)
                    WorkoutTimer(
                      duration: currentExercise.timer,
                      onComplete: _onExerciseTimerComplete,
                      autoStart: true,
                    ),

                  // Rest timer
                  if (_isResting)
                    WorkoutTimer(
                      duration: _restDuration,
                      onComplete: _onRestComplete,
                      autoStart: true,
                    ),

                  // Navigation buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _currentExerciseIndex > 0
                            ? _previousExercise
                            : null,
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Previous'),
                      ),
                      ElevatedButton.icon(
                        onPressed:
                            _currentExerciseIndex < widget.exercises.length - 1
                                ? _nextExercise
                                : null,
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Next'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildInfoItem(Icons.timer, '${widget.exercises.length} exercises'),
          _buildInfoItem(
              Icons.fitness_center, '${widget.exercises.length} exercises'),
          _buildInfoItem(
            Icons.format_list_numbered,
            '${widget.exercises.length} exercises',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 8),
        Text(text),
      ],
    );
  }

  Widget _buildExerciseCard(
      BuildContext context, Exercise exercise, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text('${index + 1}'),
        ),
        title: Text(exercise.name),
        subtitle: Text('${exercise.sets} sets × ${exercise.reps} reps'),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Instructions:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                ...(_findGymExercise(exercise.name)?.description ?? [])
                    .map((step) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('• '),
                              Expanded(child: Text(step)),
                            ],
                          ),
                        ))
                    .toList(),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildDetailChip(Icons.repeat, '${exercise.sets} sets'),
                    _buildDetailChip(
                        Icons.fitness_center, '${exercise.reps} reps'),
                    _buildDetailChip(
                        Icons.timer, '${exercise.duration} seconds'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailChip(IconData icon, String label) {
    return Chip(
      avatar: Icon(icon, size: 16),
      label: Text(label),
      backgroundColor: Colors.grey[200],
    );
  }

  Gym? _findGymExercise(String name) {
    try {
      return exercisesData.firstWhere(
        (gym) => gym.title.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
}
