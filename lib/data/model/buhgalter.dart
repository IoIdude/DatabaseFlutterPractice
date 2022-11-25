import '../../domain/entity/buhgalter_entity.dart';
import '../../domain/entity/role_entity.dart';

class Buhgalter extends BuhgalterEntity {
  Buhgalter({
    super.id,
    required super.salary,
    required super.date,
    required super.id_role,
  });

  Map<String, dynamic> toMap() {
    return {
      'salary': salary,
      'date': date,
      'id_role': id_role,
    };
  }

  factory Buhgalter.toFromMap(Map<String, dynamic> json) {
    return Buhgalter(
      id: json['id'] as int,
      salary: json['salary'],
      date: json['date'],
      id_role: RoleEnum.values
          .firstWhere((element) => element.id == (json['id_role'] as int)),
    );
  }
}
