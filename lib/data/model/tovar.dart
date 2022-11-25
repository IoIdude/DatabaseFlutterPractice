import '../../domain/entity/tovar_entity.dart';

class Tovar extends TovarEntity {
  Tovar({
    super.id,
    required super.name,
    required super.count,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'count': count,
    };
  }

  factory Tovar.toFromMap(Map<String, dynamic> json) {
    return Tovar(
      id: json['id'] as int,
      name: json['name'],
      count: json['count'],
    );
  }
}
