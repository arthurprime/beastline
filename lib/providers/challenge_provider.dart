import 'package:flutter/material.dart';
import '../models/challenge.dart';

class ChallengeProvider with ChangeNotifier {
  List<Challenge> _challenges = [];
  Challenge? _activeChallenge;

  List<Challenge> get challenges => _challenges;
  Challenge? get activeChallenge => _activeChallenge;

  void setChallenges(List<Challenge> challenges) {
    _challenges = challenges;
    notifyListeners();
  }

  void setActiveChallenge(Challenge challenge) {
    _activeChallenge = challenge;
    notifyListeners();
  }

  void addChallenge(Challenge challenge) {
    _challenges.add(challenge);
    notifyListeners();
  }

  void joinChallenge(String challengeId) {
    // Logic to join challenge
    notifyListeners();
  }
}
