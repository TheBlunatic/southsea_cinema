import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';

Movie testMovie1 = Movie(
  id: "-1",
  title: 'Test Movie',
  synopsis: 'Test synopsis for the movie.',
  ageRating: 'PG',
  posterImagePath: 'assets/images/test_movie_poster.jpg',
  ticketPrice: 10.0,
  screeningTime: 'December 17th 2015, 7:00 PM',
);

Movie testMovie2 = Movie(
  id: "-2",
  title: 'Test Movie 2: Return of the Tests',
  synopsis: 'Test synopsis for the movie, now with 10000x more :D :D :D :D :D :DDDDDD.',
  ageRating: 'PG',
  posterImagePath: 'assets/images/test_movie_poster_2_return_of_the_tests.jpg',
  ticketPrice: 6.0,
  screeningTime: 'December 17th 2015, 7:05 PM',
);

void main() {
  setUp(() {
    CartRepository.instance.clear();
  });

  group('CartRepository tests', () {
    test('starts with empty basket and zero totals', () {
      final CartRepository cart = CartRepository.instance;
      expect(cart.getItems().length, 0);
      expect(cart.getTotalPrice(), 0);
    });

    test('adds items and calculates total correctly', () {
      final CartRepository cart = CartRepository.instance;
      CartItem item1 = CartItem(
        movie: testMovie1,
        quantity: 2,
      );
      CartItem item2 = CartItem(
        movie: testMovie2,
        quantity: 1,
      );

      cart.addItem(item1);
      cart.addItem(item2);

      expect(cart.getItems().length, 2);
      expect(cart.getTotalPrice(), 26.0);
    });

    test('removes items correctly', () {
      final CartRepository cart = CartRepository.instance;
      CartItem item = CartItem(
        movie: testMovie1,
        quantity: 1,
      );
      cart.addItem(item);
      expect(cart.getItems().length, 1);

      cart.removeItem(0);
      expect(cart.getItems().length, 0);
      expect(cart.getTotalPrice(), 0.0);
    });
  });
}