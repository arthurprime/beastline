import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shop_page.dart';
import '../widgets/stats_card.dart';
import '../providers/user_provider.dart';
import '../utils/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    // Example motivational quotes
    final quotes = [
      "One more push gets you closer to greatness.",
      "Consistency is the key to progress.",
      "Every rep counts!",
      "Push your limits every day.",
    ];
    final quote = (user != null) ? quotes[user.xp % quotes.length] : quotes[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.charcoalGray,
        elevation: 0,
        centerTitle: false,
        title: SizedBox(
          height: 40,
          child: Image.asset(
            'assets/Image (1).png',
            fit: BoxFit.contain,
            color: Color(0xFF1877F3), // Facebook blue
            colorBlendMode: BlendMode.srcIn,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ShopPage()),
            ),
          ),
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user != null
                  ? 'Good morning,  A0${user.username}!' // fallback if user is null
                  : 'Good morning!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '“$quote”',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.orangeAccent,
              ),
            ),
            const SizedBox(height: 24),
            Card(
              color: Colors.blueGrey[900],
              child: ListTile(
                title: Text(
                  '100 Push-Ups Weekly Challenge',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '3 days left · 60/100 reps completed',
                  style: TextStyle(color: Colors.white70),
                ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFA500),
                  ),
                  onPressed: () {},
                  child: const Text('🔥 Join New Challenge'),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Your Stats', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StatsCard(
                  title: 'XP',
                  value: user != null ? '${user.xp} XP' : '-',
                  icon: Icons.flash_on,
                  color: Color(0xFF007BFF),
                ),
                StatsCard(
                  title: 'Streak',
                  value: user != null ? '${user.streak} Days' : '-',
                  icon: Icons.local_fire_department,
                  color: Color(0xFFFFA500),
                ),
                StatsCard(
                  title: 'Rank',
                  value: user != null ? '#${user.globalRank} / 400' : '-',
                  icon: Icons.emoji_events,
                  color: Color(0xFF28A745),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
