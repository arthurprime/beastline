class Challenge {
  final String id;
  final String title;
  final String description;
  final int goalReps;
  final int duration; // in days
  final DateTime startDate;
  final DateTime endDate;
  final int participantCount;
  final bool isActive;
  final String difficulty; // 'beginner', 'intermediate', 'hardcore'
  final int entryFee;
  final List<String> participants;

  Challenge({
    required this.id,
    required this.title,
    required this.description,
    required this.goalReps,
    required this.duration,
    required this.startDate,
    required this.endDate,
    required this.participantCount,
    required this.isActive,
    required this.difficulty,
    required this.entryFee,
    required this.participants,
  });
}
