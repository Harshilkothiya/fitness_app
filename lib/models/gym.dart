class Gym {
  final String title;
  final String imageUrl;
  final String id;
  final String difficulty;
  final List<String> description;
  final String muscle;
  final List<String> equipment;
  final int? time; // in seconds
  final int? repetitions;
  final List<String>? tips;
  final List<String>? variations;

  const Gym({
    required this.title,
    required this.imageUrl,
    required this.id,
    required this.difficulty,
    required this.description,
    required this.muscle,
    required this.equipment,
    this.time,
    this.repetitions,
    this.tips,
    this.variations,
  });
}
