import 'package:flutter/cupertino.dart';

class Yoga {
  final String title;
  final String imageUrl;
  final String id;
  final String difficulty;
  final List<String> description;
  final String duration;
  final List<String> benefits;
  final List<String> precautions;
  final String sanskritName;
  final String category;

  const Yoga({
    required this.title,
    required this.imageUrl,
    required this.id,
    required this.difficulty,
    required this.description,
    required this.benefits,
    required this.category,
    this.duration = '5-10 minutes',
    this.precautions = const [],
    this.sanskritName = '',
  });
}
