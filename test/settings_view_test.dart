import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/views/settings_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  setUp(() {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
  });
  testWidgets('SettingsView pre-fills saved settings on open', (
    WidgetTester tester,
  ) async {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.withData(<String, Object>{
          prefPatronNumber: '5555555',
          prefAddress: 'Fiveland',
          prefEmail: 'loverofthenumber5@fiveland.com',
          prefEmailUpdates: false,
        });
        await tester.pumpWidget(const MaterialApp(home: SettingsView()));
    await tester.pumpAndSettle();

    expect(find.text('5555555'), findsOneWidget);
    expect(find.text('Fiveland'), findsOneWidget);
    expect(find.text('loverofthenumber5@fiveland.com'), findsOneWidget);
    final Switch switchWidget = tester.widget<Switch>(find.byType(Switch));
    expect(switchWidget.value, isFalse);


  });
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

    await tester.enterText(patronNumberField, '5555555');
    await tester.enterText(addressField, 'Fiveland');
    await tester.enterText(
      emailField,
      'loverofthenumber5@fiveland.com',
    );

    final Finder switchFinder = find.byType(Switch);
    expect(tester.widget<Switch>(switchFinder).value, isTrue);
    await tester.tap(switchFinder);
    await tester.pump();
    expect(tester.widget<Switch>(switchFinder).value, isFalse);

    await tester.tap(find.text('SAVE SETTINGS'));
    await tester.pump();

    expect(find.text('Settings saved for loverofthenumber5@fiveland.com'), findsOneWidget);

    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    expect(await prefs.getString(prefPatronNumber), '5555555');
    expect(await prefs.getString(prefAddress), 'Fiveland');
    expect(
      await prefs.getString(prefEmail),
      'loverofthenumber5@fiveland.com',
    );
    expect(await prefs.getBool(prefEmailUpdates), isFalse);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpWidget(const MaterialApp(home: SettingsView()));
    await tester.pumpAndSettle();
    expect(find.text('5555555'), findsOneWidget);
    expect(find.text('Fiveland'), findsOneWidget);
    expect(
      find.text('loverofthenumber5@fiveland.com'),
      findsOneWidget,
    );
    final Switch reopenedSwitch = tester.widget<Switch>(find.byType(Switch));
    expect(reopenedSwitch.value, isFalse);
  });
}