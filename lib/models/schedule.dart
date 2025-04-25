import 'package:flutter/material.dart';

class ScheduleItem {
  final String title;
  final String description;
  final DateTime dateTime;
  final String type; // 'workout' or 'meal' or 'other'
  final bool isCompleted;
  final Color color;

  ScheduleItem({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.type,
    this.isCompleted = false,
    Color? color,
  }) : color = color ?? _getDefaultColor(type);

  static Color _getDefaultColor(String type) {
    switch (type) {
      case 'workout':
        return Colors.blue;
      case 'meal':
        return Colors.green;
      default:
        return Colors.purple;
    }
  }

  ScheduleItem copyWith({
    String? title,
    String? description,
    DateTime? dateTime,
    String? type,
    bool? isCompleted,
    Color? color,
  }) {
    return ScheduleItem(
      title: title ?? this.title,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      type: type ?? this.type,
      isCompleted: isCompleted ?? this.isCompleted,
      color: color ?? this.color,
    );
  }
}

class WeeklySchedule {
  final Map<DateTime, List<ScheduleItem>> scheduleItems;

  WeeklySchedule({required this.scheduleItems});

  List<ScheduleItem> getItemsForDate(DateTime date) {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    return scheduleItems[normalizedDate] ?? [];
  }

  void addItem(DateTime date, ScheduleItem item) {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    if (!scheduleItems.containsKey(normalizedDate)) {
      scheduleItems[normalizedDate] = [];
    }
    scheduleItems[normalizedDate]!.add(item);
  }

  void removeItem(DateTime date, ScheduleItem item) {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    scheduleItems[normalizedDate]?.remove(item);
  }

  void toggleItemCompletion(DateTime date, ScheduleItem item) {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    final items = scheduleItems[normalizedDate];
    if (items != null) {
      final index = items.indexOf(item);
      if (index != -1) {
        items[index] = item.copyWith(isCompleted: !item.isCompleted);
      }
    }
  }
}
