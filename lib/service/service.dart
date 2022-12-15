import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:movie_app/models/film.dart';

String url = 'https://movie-api-65n7.onrender.com/v1';

Future<List<Film>> api(String litmit) async {
  var response = await http.get(Uri.parse('$url$litmit'));
  List<Film> films = [];
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body) as List;
    films = jsonResponse.map((e) => Film.fromJson(e)).toList();
  } else {
    print('Request failed with status:');
  }
  return films;
}
