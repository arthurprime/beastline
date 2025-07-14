class User {
  final String id;
  final String username;
  final String email;
  final int xp;
  final int level;
  final int streak;
  final int totalReps;
  final int globalRank;
  final List<String> badges;
  final String avatarUrl;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.xp,
    required this.level,
    required this.streak,
    required this.totalReps,
    required this.globalRank,
    required this.badges,
    required this.avatarUrl,
  });
}
