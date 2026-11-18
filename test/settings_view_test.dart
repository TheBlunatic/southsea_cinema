import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/views/settings_view.dart';

void main() {
  testWidgets('SettingsView displays form fields and switches', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: SettingsView()));

    expect(find.text('My Settings'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(3));
    expect(find.text('Address'), findsOneWidget);
    expect(find.text('Email Address'), findsOneWidget);
    expect(find.text('Patron Number'), findsOneWidget);
    expect(find.text('Preferences'), findsOneWidget);
    expect(find.byType(Switch), findsOneWidget);
    expect(find.text('SAVE SETTINGS'), findsOneWidget);
  });

  testWidgets('Toggling switch and saving settings updates state', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: SettingsView()));

    final Finder addressField = find.widgetWithText(TextField, 'Your address');
    final Finder emailField = find.widgetWithText(TextField, 'Email address');
    final Finder patronNumberField = find.widgetWithText(TextField, 'Patron number');

    await tester.enterText(patronNumberField, '12416');
    await tester.enterText(addressField, '20 Emu Road, Shropshire');
    await tester.enterText(emailField, 'graham@example.com');

    final Finder switchFinder = find.byType(Switch);
    expect(tester.widget<Switch>(switchFinder).value, isTrue);
    await tester.tap(switchFinder);
    await tester.pump();
    expect(tester.widget<Switch>(switchFinder).value, isFalse);

    await tester.tap(find.text('SAVE SETTINGS'));
    await tester.pump();

    expect(find.text('Settings saved for graham@example.com'), findsOneWidget);
  });
}