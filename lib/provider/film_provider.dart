import 'package:flutter/material.dart';
import 'package:movie_app/models/film.dart';
import 'package:movie_app/service/service.dart';

class FilmProvider extends ChangeNotifier {
  FilmProvider();

  Future<List<Film>> getFilm() {
    return api('?limit=5');
  }

  Future<List<Film>> getFilmToPage(int limit) {
    return api('?limit=$limit');
  }
}
