import 'package:flutter/material.dart';
import 'package:movie_app/models/film.dart';
import 'package:movie_app/models/profile_film.dart';
import 'package:movie_app/service/service.dart';

class FilmProvider extends ChangeNotifier {
  List<Film> _films = [];

  bool isLoading = false;
  int limit = 24;
  List<Film> get films => _films;

  Future<List<Film>> getFilm() {
    return api('?limit=5');
  }

  updateToPage(int page) async {
    limit *= page;
    notifyListeners();
    getFilmToPage();
  }

  Future<void> getFilmToPage() async {
    isLoading = true;
    notifyListeners();
    final response = await api('?limit=$limit');
    _films = response;
    isLoading = false;
    notifyListeners();
  }

  Future<Profilefilm?> getProfileFilmToIMDB(String link) {
    return profile(link);
  }
}
