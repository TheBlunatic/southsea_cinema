import 'package:southsea_cinema/models/movie.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class MovieRepository {
  List<Movie>? _cachedMovies;

  Future<List<Movie>> loadMoviesFromAsset({
    String assetPath = 'assets/data/movies.json',
  }) async {
    final String jsonString = await rootBundle.loadString(assetPath);
    final dynamic decodedData = jsonDecode(jsonString);
    final List<dynamic> jsonList = decodedData as List<dynamic>;
    final List<Movie> loadedMovies = [];
    for (final dynamic item in jsonList) {
      final Map<String, dynamic> itemMap = item as Map<String, dynamic>;
      final Movie movie = Movie.fromJson(itemMap);
      loadedMovies.add(movie);
    }

    _cachedMovies = loadedMovies;
    return loadedMovies;
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }

  List<Movie> getMovies() {
    final List<Movie>? cachedMovies = _cachedMovies;
    if (cachedMovies != null) {
      return cachedMovies;
    }

    return [
      Movie(
        id: "0",
        title: 'Dune: Part One',
        synopsis:
            "Paul Atreides arrives on Arrakis\nafter his father accepts the\nstewardship of the dangerous\nplanet. However, chaos ensues after\na betrayal as forces clash to\ncontrol melange, a precious \nresource.",
        ageRating: '12A',
        screeningTime: '7:00 PM',
        ticketPrice: 12.50,
        posterImagePath: 'assets/images/dunepart1poster2021.jpg',
      ),
      Movie(
        id: "1",
        title: 'Jurassic Park (1993)',
        synopsis:
            "An industrialist invites some \nexperts to visit his theme park of \ncloned dinosaurs. After a power \nfailure, the creatures run loose, \nputting everyone's lives, including \nhis grandchildren's, in danger.",
        ageRating: 'PG',
        screeningTime: '9:00 PM',
        ticketPrice: 7.50,
        posterImagePath: 'assets/images/jurassicparkposter1993.jpg',
      ),
    ];
  }
}
