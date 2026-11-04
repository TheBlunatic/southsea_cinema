import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  testWidgets('Ensure movie repository works as intended',
      (WidgetTester tester) async {
    MovieRepository movieRepository = MovieRepository();
    List<Movie> movies = movieRepository.getMovies();

    expect(movies.length, 2);

    Movie? movieInvalid = movieRepository.getMovieById("invalid");
    expect(movieInvalid, isNull);

    Movie? movie1 = movieRepository.getMovieById("1");
    expect(movie1, isNotNull);
    expect(movie1!.id, "1");
  });
}
