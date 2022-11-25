import '../../domain/entity/postavshik_entity.dart';

class Postavshik extends PostavshikEntity {
  final String password;

  Postavshik({
    super.id,
    required super.company_name,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'company_name': company_name,
      'password': password,
    };
  }

  factory Postavshik.toFromMap(Map<String, dynamic> json) {
    return Postavshik(
      id: json['id'] as int,
      company_name: json['company_name'],
      password: json['password'],
    );
  }
}
