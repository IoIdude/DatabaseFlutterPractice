class ClientEntity {
  late int id;
  final String surname;
  final String name;
  final String middleName;
  final String email;
  final String password;

  ClientEntity({
    this.id = 0,
    required this.surname,
    required this.name,
    required this.middleName,
    required this.email,
    this.password = '',
  });
}
