import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/user_settings.dart';

void main() {
  group('UserSettings', () {
    test('should create a UserSettings instance with default values', () {
      final userSettings = UserSettings();

      expect(userSettings.address, '');
      expect(userSettings.email, '');
      expect(userSettings.patronNumber, '');
      expect(userSettings.recieveNewsByEmail, true);
    });

    test('should create a UserSettings instance with specified values', () {
      final userSettings = UserSettings(
        address: '7357 Test Road, Testington',
        email: 'test@testdomain.nz',
        patronNumber: '7357',
        recieveNewsByEmail: false,
      );

      expect(userSettings.address, '7357 Test Road, Testington');
      expect(userSettings.email, 'test@testdomain.nz');
      expect(userSettings.patronNumber, '7357');
      expect(userSettings.recieveNewsByEmail, false);
    });
  });
}