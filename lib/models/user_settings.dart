class UserSettings {
  final String address;
  final String email;
  final String patronNumber;
  final bool recieveNewsByEmail;

  const UserSettings({
    this.address = '',
    this.email = '',
    this.patronNumber = '',
    this.recieveNewsByEmail = true, // evil >:)
  });
}