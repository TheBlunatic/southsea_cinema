import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/home_view.dart';

void main() {
    group('App home tests', () {
    testWidgets('App displays HomeView as home', (WidgetTester tester) async {
      SouthseaCinemaApp app = const SouthseaCinemaApp();
      await tester.pumpWidget(app);
      expect(find.byType(HomeView), findsOneWidget);
      expect(find.text(appTitle), findsOneWidget);
    });

    testWidgets('Displays movie cards with names and info',
        (WidgetTester tester) async {
      SouthseaCinemaApp app = const SouthseaCinemaApp();
      await tester.pumpWidget(app);
      expect(find.text('Dune: Part One'), findsOneWidget);
      expect(find.text('Jurassic Park (1993)'), findsOneWidget);
    });
  });
}
