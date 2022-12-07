import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pelicula/models/credits_response.dart';
import 'package:pelicula/models/now_playing_response.dart';
import 'package:pelicula/models/popular_response.dart';
import 'package:pelicula/models/search_movies_response.dart';

import '../models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _apyKey = 'e7328b3bbb60d2808fa12653ba073253';
  String _baseURL = 'api.themoviedb.org';
  String _languaje = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovie = [];
  Map<int, List<Cast>> moviecast = {};
  int cont = 0;

  MoviesProvider() {
    print('MoviesProvider inicializado');
    this.getOnDisplaysMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseURL, endpoint,
        {'api_key': _apyKey, 'language': _languaje, 'page': '$page'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplaysMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowplayinresponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowplayinresponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    cont++;

    final jsonData = await _getJsonData('3/movie/popular', cont);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovie = [...popularMovie, ...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieid) async {
    if (moviecast.containsKey(movieid)) return moviecast[movieid]!;
    print('solicidanto el celda');
    final jsonData = await _getJsonData('3/movie/$movieid/credits', cont);
    final creditsResponse = CreditsResponse.fromJson(jsonData);
    moviecast[movieid] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovie(String query) async {
    final url = Uri.https(_baseURL, '3/search/movie',
        {'api_key': _apyKey, 'language': _languaje, 'query': query});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);
    return searchResponse.results;
  }
}
