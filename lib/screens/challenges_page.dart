
import 'package:flutter/material.dart';

class ChallengesPage extends StatefulWidget {
  const ChallengesPage({super.key});

  @override
  State<ChallengesPage> createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        title: const Text('Challenges', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Offline'),
            Tab(text: 'Live'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAllTab(context),
          _buildOfflineTab(context),
          _buildLiveTab(context),
        ],
      ),
    );
  }

  Widget _buildAllTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _offlineSection(context),
        const SizedBox(height: 32),
        _liveSection(context),
      ],
    );
  }

  Widget _buildOfflineTab(BuildContext context) => ListView(padding: const EdgeInsets.all(16), children: [_offlineSection(context)]);
  Widget _buildLiveTab(BuildContext context) => ListView(padding: const EdgeInsets.all(16), children: [_liveSection(context)]);

  Widget _offlineSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.fitness_center, color: Colors.blueAccent),
              SizedBox(width: 8),
              Text('Offline Challenges', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
          const SizedBox(height: 16),
          _createOwnChallengeCard(),
          const SizedBox(height: 16),
          _activeSelfChallengeCard(),
          const SizedBox(height: 16),
          _pastChallengesList(),
        ],
      ),
    );
  }

  Widget _createOwnChallengeCard() {
    return Card(
      color: Colors.blueGrey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Create Your Own Challenge', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Set goal (e.g., 200 push-ups in 5 days)',
                labelStyle: const TextStyle(color: Colors.white70),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Difficulty:', style: TextStyle(color: Colors.white70)),
                const SizedBox(width: 8),
                ChoiceChip(label: Text('Beginner'), selected: true),
                SizedBox(width: 4),
                ChoiceChip(label: Text('Intermediate'), selected: false),
                SizedBox(width: 4),
                ChoiceChip(label: Text('Hardcore'), selected: false),
              ],
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Start'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _activeSelfChallengeCard() {
    return Card(
      color: Colors.blueGrey[700],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.show_chart, color: Colors.orangeAccent),
                SizedBox(width: 8),
                Text('Active Self-Challenge', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.6,
              minHeight: 8,
              backgroundColor: Colors.blueGrey[600],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('120/200 reps', style: TextStyle(color: Colors.white)),
                Text('2 days left', style: TextStyle(color: Colors.white70)),
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Resume Challenge'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pastChallengesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Past Challenges', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blueGrey[600],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.greenAccent),
                title: Text('Challenge ${index + 1}', style: const TextStyle(color: Colors.white)),
                subtitle: const Text('Best streak: 5 days\nAvg reps/day: 40\nXP: 150', style: TextStyle(color: Colors.white70)),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _liveSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.cyanAccent, width: 2),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.flash_on, color: Colors.cyanAccent),
              SizedBox(width: 8),
              Text('Live Challenges', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.cyanAccent)),
            ],
          ),
          const SizedBox(height: 16),
          _availableLiveChallengeCard(),
          const SizedBox(height: 16),
          _ongoingLiveChallengeCard(),
          const SizedBox(height: 16),
          _upcomingEventsList(),
        ],
      ),
    );
  }

  Widget _availableLiveChallengeCard() {
    return Card(
      color: Colors.black87,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Push-Up War – 10 Min Blitz', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyanAccent)),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.people, color: Colors.cyanAccent),
                SizedBox(width: 4),
                Text('42 Online Now', style: TextStyle(color: Colors.white)),
                SizedBox(width: 16),
                Icon(Icons.emoji_events, color: Colors.amber),
                SizedBox(width: 4),
                Text('+300 XP / Winner Badge', style: TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 12),
            Center(
              child: AnimatedPulseButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ongoingLiveChallengeCard() {
    return Card(
      color: Colors.black54,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.timer, color: Colors.cyanAccent),
                SizedBox(width: 8),
                Text('Ongoing Live Challenge', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyanAccent)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Time left: 07:32', style: TextStyle(color: Colors.white)),
                Text('Rank: #5', style: TextStyle(color: Colors.white70)),
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.cyanAccent),
                onPressed: () {},
                child: const Text('Resume Live Challenge', style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _upcomingEventsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Upcoming Events', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyanAccent)),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.black38,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                leading: const Icon(Icons.event, color: Colors.cyanAccent),
                title: Text('Event ${index + 1}', style: const TextStyle(color: Colors.white)),
                subtitle: const Text('Scheduled group challenge', style: TextStyle(color: Colors.white70)),
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text('Set Reminder', style: TextStyle(color: Colors.cyanAccent)),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class AnimatedPulseButton extends StatefulWidget {
  @override
  State<AnimatedPulseButton> createState() => _AnimatedPulseButtonState();
}

class _AnimatedPulseButtonState extends State<AnimatedPulseButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.15).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyanAccent,
          foregroundColor: Colors.black,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
        child: const Text('Join Live'),
      ),
    );
  }
}
