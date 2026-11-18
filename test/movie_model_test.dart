import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  testWidgets('Test movie formatted ticket price', (WidgetTester tester) async {
    Movie movie;

    movie = Movie(
      id: "-1",
      title: 'Test Movie',
      synopsis: 'Test synopsis for the movie.',
      ageRating: 'PG',
      posterImagePath: 'assets/images/test_movie_poster.jpg',
      ticketPrice: 10.0,
      screeningTime: 'December 17th 2015, 7:00 PM',
    );

    expect(movie.formattedTicketPrice, '£10.00');

    movie = Movie(
      id: "-1",
      title: 'Test Movie',
      synopsis: 'Test synopsis for the movie.',
      ageRating: 'PG',
      posterImagePath: 'assets/images/test_movie_poster.jpg',
      ticketPrice: 10.50,
      screeningTime: 'December 17th 2015, 7:00 PM',
    );

    expect(movie.formattedTicketPrice, '£10.50');
  });

  test('JSON conversion preserves every movie field and conversion back to JSON is functional', () {
    final Map<String, dynamic> movieJson = {
      'id': '-1',
      'title': 'Test Movie?!?!',
      'synopsis': 'Test synopsis for test movie?!?!',
      'ageRating': 'PG!!1!!!',
      'posterImagePath': 'assets/images/test_movie_poster.jpg',
      'ticketPrice': 10.0,
      'screeningTime': 'December 17th 7357 BC, 7:00 PM',
    };

    final Movie movie = Movie.fromJson(movieJson);
    expect(movie.id, "-1");
    expect(movie.title, "Test Movie?!?!");
    expect(movie.synopsis, "Test synopsis for test movie?!?!");
    expect(movie.ageRating, "PG!!1!!!");
    expect(movie.posterImagePath, "assets/images/test_movie_poster.jpg");
    expect(movie.ticketPrice, 10.0);
    expect(movie.screeningTime, "December 17th 7357 BC, 7:00 PM");

    final Map<String, dynamic> convertedJson = movie.toJson();
    expect(convertedJson, movieJson);
  });
}
