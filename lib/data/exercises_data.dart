import '../models/gym.dart';

final List<Gym> exercisesData = [
  Gym(
    title: 'Push-ups',
    imageUrl: 'https://example.com/pushup.jpg',
    id: 'c1',
    difficulty: 'Beginner',
    description: [
      'Start in a plank position with your hands shoulder-width apart',
      'Lower your body until your chest nearly touches the ground',
      'Push your body back up to the starting position',
      'Repeat for the desired number of repetitions'
    ],
    muscle: 'Chest',
    equipment: ['None'],
    time: null,
    repetitions: null,
  ),
  Gym(
    title: 'Squats',
    imageUrl: 'https://example.com/squat.jpg',
    id: 'l1',
    difficulty: 'Beginner',
    description: [
      'Stand with feet shoulder-width apart',
      'Lower your body by bending your knees and hips',
      'Keep your back straight and chest up',
      'Return to the starting position',
      'Repeat for the desired number of repetitions'
    ],
    muscle: 'Legs',
    equipment: ['None'],
    time: null,
    repetitions: null,
  ),
  // Add more exercises as needed
];
