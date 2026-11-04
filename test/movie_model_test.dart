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
}
