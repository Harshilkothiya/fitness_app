import '../models/cardio.dart';

final List<Cardio> cardioData = [
  const Cardio(
    title: 'Burpees',
    imageUrl: 'assets/images/cardio/burpees.jpg',
    id: 'c1',
    difficulty: 'Advanced',
    description: [
      'Start in a standing position',
      'Drop into a squat position with your hands on the ground',
      'Kick your feet back into a plank position',
      'Do one push-up',
      'Jump your feet back to the squat position',
      'Jump up from squatting position with your arms extending above',
    ],
    equipment: 'No equipment needed',
    repetitions: null,
    time: null,
    benefits: [
      'Full body workout',
      'Improves cardiovascular endurance',
      'Builds strength and power',
      'Burns calories efficiently',
    ],
  ),
  const Cardio(
    title: 'Jump Rope',
    imageUrl: 'assets/images/cardio/jump_rope.jpg',
    id: 'c2',
    difficulty: 'Beginner',
    description: [
      'Choose the right rope',
      'Stand up and pick up the rope',
      'Extend your hands and forearms',
      'Step over the rope',
      'Use your hands and wrists to swing the rope',
      'When the rope comes toward your feet, hop over it',
      'Set a comfortable pace',
      'Maintain proper form',
    ],
    equipment: 'Jump rope',
    repetitions: null,
    time: null,
    benefits: [
      'Improves heart health',
      'Increases concentration and stamina',
      'Increases body flexibility',
      'Boosts mental health',
      'Decreases belly fat',
      'Strengthens bones',
    ],
  ),
  // Add more cardio exercises here...
];
