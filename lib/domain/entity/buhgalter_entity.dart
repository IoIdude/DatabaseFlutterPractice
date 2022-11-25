import 'dart:ffi';

import 'package:firstprogflutter/domain/entity/role_entity.dart';

class BuhgalterEntity {
  late int id;
  final int salary;
  final DateTime date;
  final RoleEnum id_role;

  BuhgalterEntity({
    this.id = 0,
    required this.salary,
    required this.date,
    required this.id_role,
  });
}
