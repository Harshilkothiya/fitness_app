import 'package:flutter/material.dart';

class WorkoutTimer extends StatefulWidget {
  final int duration;
  final VoidCallback onComplete;
  final bool autoStart;

  const WorkoutTimer({
    Key? key,
    required this.duration,
    required this.onComplete,
    this.autoStart = false,
  }) : super(key: key);

  @override
  State<WorkoutTimer> createState() => _WorkoutTimerState();
}

class _WorkoutTimerState extends State<WorkoutTimer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isRunning = false;
  int _remainingSeconds = 0;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.duration;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _remainingSeconds =
              (widget.duration * (1 - _animation.value)).round();
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onComplete();
        }
      });

    if (widget.autoStart) {
      _startTimer();
    }
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });
    _controller.forward(from: 1 - (_remainingSeconds / widget.duration));
  }

  void _pauseTimer() {
    setState(() {
      _isRunning = false;
    });
    _controller.stop();
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _remainingSeconds = widget.duration;
    });
    _controller.reset();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _formatTime(_remainingSeconds),
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _isRunning ? _pauseTimer : _startTimer,
                icon: Icon(
                  _isRunning ? Icons.pause : Icons.play_arrow,
                  size: 32,
                ),
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: _resetTimer,
                icon: const Icon(Icons.refresh, size: 32),
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
