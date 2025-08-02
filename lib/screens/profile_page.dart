import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors
    const bgColor = Color(0xFF10131A);
    const neonBlue = Color(0xFF3A8DFF);
    const neonGreen = Color(0xFF2FFFA3);
    const gold = Color(0xFFFFD700);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.home, color: neonBlue, size: 32),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Your Profile',
          style: TextStyle(
            color: neonGreen,
            fontWeight: FontWeight.bold,
            fontSize: 26,
            letterSpacing: 1.2,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: neonBlue, size: 32),
            onPressed: () {
              // TODO: Open settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top Section: Avatar + Basic Info
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Glowing border for level rarity
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const RadialGradient(
                        colors: [neonBlue, Colors.transparent],
                        radius: 0.8,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: neonBlue.withOpacity(0.7),
                          blurRadius: 24,
                          spreadRadius: 6,
                        ),
                      ],
                    ),
                  ),
                  // Cartoon Avatar (replace with animated widget)
                  GestureDetector(
                    onTap: () {
                      // TODO: Open avatar customization
                    },
                    child: CircleAvatar(
                      radius: 52,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.fitness_center, size: 60, color: neonBlue),
                    ),
                  ),
                  // Edit icon
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: neonGreen,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: neonGreen.withOpacity(0.5),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.edit, color: bgColor, size: 22),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Username
            const Text(
              '@FitArthur',
              style: TextStyle(
                color: neonBlue,
                fontWeight: FontWeight.w900,
                fontSize: 22,
                fontFamily: 'Comic Sans MS', // Use a fun font if available
                letterSpacing: 1.1,
              ),
            ),
            // Level Tag
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: gold,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: gold.withOpacity(0.4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const Text(
                '🏅 Level 5 – Endurance Beast',
                style: TextStyle(
                  color: bgColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            // XP Progress Bar
            Column(
              children: [
                const Text(
                  '1340 XP / 1500 XP',
                  style: TextStyle(
                    color: neonGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: 1340 / 1500,
                    minHeight: 10,
                    backgroundColor: Colors.white12,
                    valueColor: AlwaysStoppedAnimation<Color>(neonGreen),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            // Middle Section: Stats & Achievements
            Card(
              color: bgColor,
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _statCard('🛡️', '3,450', 'Push-Ups'),
                        _statCard('🔥', '9', 'Day Streak'),
                        _statCard('🏆', '27', 'Challenges'),
                        _statCard('🥇', 'Rank #1', '(3x)'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Badges Carousel
                    SizedBox(
                      height: 70,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _badgeCard('First 100 Reps', neonBlue, true),
                          _badgeCard('Live Champion', neonGreen, true),
                          _badgeCard('7-Day Streak', gold, true),
                          _badgeCard('Locked', Colors.grey, false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            // Lower Section: Activity History & Sharing
            Card(
              color: bgColor,
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Challenge History',
                      style: TextStyle(
                        color: neonBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Challenge History List (replace with dynamic data)
                    _challengeHistoryCard(
                      title: 'Endurance Test – Level 2',
                      date: 'Jul 30, 2025',
                      reps: 120,
                      xp: 80,
                      top3: true,
                    ),
                    _challengeHistoryCard(
                      title: 'Speed Run – Level 1',
                      date: 'Jul 28, 2025',
                      reps: 90,
                      xp: 60,
                      top3: false,
                    ),
                    const SizedBox(height: 12),
                    // Social / Invite Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: neonBlue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          icon: const Icon(Icons.mail),
                          label: const Text('Invite Friends'),
                          onPressed: () {
                            // TODO: Invite logic
                          },
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: neonGreen,
                            foregroundColor: bgColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          icon: const Icon(Icons.visibility),
                          label: const Text('View as Public'),
                          onPressed: () {
                            // TODO: View as public
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Privacy Toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Privacy:',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        DropdownButton<String>(
                          value: 'Public',
                          dropdownColor: bgColor,
                          items: const [
                            DropdownMenuItem(value: 'Public', child: Text('Public')),
                            DropdownMenuItem(value: 'Friends', child: Text('Friends')),
                            DropdownMenuItem(value: 'Private', child: Text('Private')),
                          ],
                          onChanged: (v) {
                            // TODO: Change privacy
                          },
                          style: const TextStyle(color: neonGreen),
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications, color: neonBlue),
                          onPressed: () {
                            // TODO: Notification preferences
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.videocam, color: neonGreen),
                          onPressed: () {
                            // TODO: Camera permissions
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper for stat cards
  Widget _statCard(String icon, String value, String label) {
    return Column(
      children: [
        Text(icon, style: const TextStyle(fontSize: 28)),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  // Helper for badge cards
  Widget _badgeCard(String label, Color color, bool unlocked) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: unlocked ? color : Colors.grey[800],
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: unlocked ? color.withOpacity(0.5) : Colors.black54,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            unlocked ? Icons.emoji_events : Icons.lock,
            color: unlocked ? Colors.white : Colors.grey,
            size: 22,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: unlocked ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  // Helper for challenge history cards
  Widget _challengeHistoryCard({
    required String title,
    required String date,
    required int reps,
    required int xp,
    required bool top3,
  }) {
    return Card(
      color: Colors.white10,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(
          top3 ? Icons.emoji_events : Icons.fitness_center,
          color: top3 ? Colors.amber : Colors.blueAccent,
          size: 32,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          '$date\n$reps reps • $xp XP',
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        trailing: top3
            ? const Icon(Icons.emoji_events, color: Colors.amber, size: 24)
            : null,
      ),
    );
  }
}
