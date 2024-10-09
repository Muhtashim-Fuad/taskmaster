import 'package:flutter/material.dart';
import 'package:task_master/models/card.dart';

class Project extends ChangeNotifier {
  final String title;
  final List<CardData> cards;
  final Color thumbnailColor;

  Project(
      {required this.title,
      required this.cards,
      this.thumbnailColor = Colors.purple});

  void clear() {
    cards.clear();
    notifyListeners();
  }

  void removeCard(CardData card) {
    cards.remove(card);
    notifyListeners();
  }

  void addCard(String label) {
    CardData card = CardData(
      title: label,
      tasks: [],
    );
    cards.insert(0, card);
    notifyListeners();
  }

  void reorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) newIndex -= 1;
    final CardData card = cards.removeAt(oldIndex);
    cards.insert(newIndex, card);
    notifyListeners();
  }
}
