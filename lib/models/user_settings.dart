class UserSettings {
  final String address;
  final String email;
  final int patronNumber;
  final bool recieveNewsByEmail;

  const UserSettings({
    this.address = '',
    this.email = '',
    this.patronNumber = 0,
    this.recieveNewsByEmail = true, // evil >:)
  });
}