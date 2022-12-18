import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:movie_app/models/film.dart';
import 'package:movie_app/models/profile_film.dart';

String url = 'https://movie-api-65n7.onrender.com/v1';

Future<List<Film>> api(String litmit) async {
  var response = await http.get(Uri.parse('$url$litmit'));

  List<Film> films = [];
  try {
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List;
      films = jsonResponse.map((e) => Film.fromJson(e)).toList();
    }
  } catch (e) {
    print(e);
  }

  return films;
}

Future<Profilefilm?> profile(String link) async {
  var response = await http.get(Uri.parse(link));
  Profilefilm? pf;

  try {
    var jsonResponse = convert.jsonDecode(response.body) as List;
    pf = Profilefilm.fromJson(jsonResponse[0]);
  } catch (e) {
    print(e);
  }
  return pf;
}
