import 'package:firstprogflutter/domain/entity/role_entity.dart';

class UserEntity {
  late int id;
  final String login;
  final String password;
  final RoleEnum id_role;

  UserEntity({
    this.id = 0,
    required this.login,
    this.password = '',
    required this.id_role,
  });
}
