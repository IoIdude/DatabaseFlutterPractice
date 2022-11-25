import '../../domain/entity/client_entity.dart';

class Client extends ClientEntity {
  final String password;

  Client({
    super.id,
    required super.surname,
    required super.name,
    required super.middleName,
    required super.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'surname': surname,
      'name': name,
      'middleName': middleName,
      'email': email,
      'password': password,
    };
  }

  factory Client.toFromMap(Map<String, dynamic> json) {
    return Client(
      id: json['id'] as int,
      surname: json['surname'],
      name: json['name'],
      middleName: json['middleName'],
      email: json['email'],
      password: json['password'],
    );
  }
}
