import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  List<Map<String, dynamic>> _favoriteJobs = [];

  // Favori ilanları almak için getter
  List<Map<String, dynamic>> get favoriteJobs => _favoriteJobs;

  // İlanı favorilere ekleme ve çıkartma işlemi
  void toggleFavorite(Map<String, dynamic> job) {
    if (_favoriteJobs.any((element) => element["id"] == job["id"])) {
      _favoriteJobs.removeWhere((element) => element["id"] == job["id"]); // Favoriden çıkar
    } else {
      _favoriteJobs = List.from(_favoriteJobs)..add(job); // Favorilere ekle
    }
    notifyListeners(); // Dinleyicilere değişiklik olduğunu bildir
  }

  // Favorilerde olup olmadığını kontrol etme
  bool isFavorited(Map<String, dynamic> job) {
    return _favoriteJobs.any((element) => element["id"] == job["id"]);
  }
}
