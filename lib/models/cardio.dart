class Cardio {
  final String title;
  final String imageUrl;
  final String id;
  final String difficulty;
  final List<String> description;
  final String equipment;
  final int? repetitions;
  final String? time;
  final List<String>? benefits;

  const Cardio({
    required this.title,
    required this.imageUrl,
    required this.id,
    required this.difficulty,
    required this.description,
    required this.equipment,
    this.repetitions,
    this.time,
    this.benefits,
  });
}
