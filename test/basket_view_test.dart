import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';
import 'package:southsea_cinema/views/basket_view.dart';

Movie testMovie1 = Movie(
  id: "-1",
  title: 'Test Movie',
  synopsis: 'Test synopsis for the movie.',
  ageRating: 'PG',
  posterImagePath: 'assets/images/test_movie_poster.jpg',
  ticketPrice: 10.0,
  screeningTime: 'December 17th 2015, 7:00 PM',
);

void main() {
  setUp(() {
    CartRepository.instance.clear();
  });

  testWidgets('BasketView displays empty message when basket has no items', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: BasketView()));

    expect(find.text('Your basket is empty'), findsOneWidget);
    expect(find.text('Checkout'), findsNothing);
  });

  testWidgets(
    'BasketView renders items and removes item when delete pressed',
    (WidgetTester tester) async {
      CartItem item = CartItem(
        movie: testMovie1,
        quantity: 2,
      );
      CartRepository.instance.addItem(item);

      await tester.pumpWidget(const MaterialApp(home: BasketView()));

      expect(find.text('Your basket'), findsOneWidget);
      expect(find.text('2 x Test Movie'), findsOneWidget);
      expect(find.text('£20.00'), findsWidgets); // will be shown twice, in item total and listing
      expect(find.text('Checkout'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pump();

      expect(find.text('Your basket is empty'), findsOneWidget);
    },
  );
}