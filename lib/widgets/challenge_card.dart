import 'package:flutter/material.dart';
import '../models/challenge.dart';
import '../utils/theme.dart';

class ChallengeCard extends StatelessWidget {
  final Challenge challenge;
  final VoidCallback? onJoin;

  const ChallengeCard({super.key, required this.challenge, this.onJoin});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.sports_gymnastics, color: AppTheme.electricBlue),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    challenge.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                if (challenge.entryFee > 0)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.neonOrange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${challenge.entryFee} coins',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8),
            Text(challenge.description),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.people, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text('${challenge.participantCount} participants'),
                SizedBox(width: 16),
                Icon(Icons.timer, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text('${challenge.duration} days'),
              ],
            ),
            SizedBox(height: 12),
            if (onJoin != null)
              ElevatedButton(onPressed: onJoin, child: Text('Join')),
          ],
        ),
      ),
    );
  }
}
