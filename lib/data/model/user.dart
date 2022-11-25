import 'package:firstprogflutter/domain/entity/role_entity.dart';
import 'package:firstprogflutter/domain/entity/user_entity.dart';
import 'package:flutter/foundation.dart';

class User extends UserEntity {
  final String password;

  User({
    super.id,
    required super.login,
    required super.id_role,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'password': password,
      'id_role': id_role,
    };
  }

  factory User.toFromMap(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      login: json['login'],
      id_role: RoleEnum.values
          .firstWhere((element) => element.id == (json['id_role'] as int)),
      password: json['password'],
    );
  }
}
