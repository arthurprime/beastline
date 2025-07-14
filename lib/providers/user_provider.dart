import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void updateXP(int xp) {
    if (_user != null) {
      _user = User(
        id: _user!.id,
        username: _user!.username,
        email: _user!.email,
        xp: _user!.xp + xp,
        level: _user!.level,
        streak: _user!.streak,
        totalReps: _user!.totalReps,
        globalRank: _user!.globalRank,
        badges: _user!.badges,
        avatarUrl: _user!.avatarUrl,
      );
      notifyListeners();
    }
  }

  void updateStreak(int streak) {
    if (_user != null) {
      _user = User(
        id: _user!.id,
        username: _user!.username,
        email: _user!.email,
        xp: _user!.xp,
        level: _user!.level,
        streak: streak,
        totalReps: _user!.totalReps,
        globalRank: _user!.globalRank,
        badges: _user!.badges,
        avatarUrl: _user!.avatarUrl,
      );
      notifyListeners();
    }
  }
}
