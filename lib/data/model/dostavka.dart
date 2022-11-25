import '../../domain/entity/dostavka_entity.dart';

class Dostavka extends DostavkaEntity {
  Dostavka({
    super.id,
    required super.number_of_house,
    required super.name_street,
    required super.floor,
    required super.korpus,
  });

  Map<String, dynamic> toMap() {
    return {
      'number_of_house': number_of_house,
      'name_street': name_street,
      'floor': floor,
      'korpus': korpus,
    };
  }

  factory Dostavka.toFromMap(Map<String, dynamic> json) {
    return Dostavka(
      id: json['id'] as int,
      number_of_house: json['number_of_house'],
      name_street: json['name_street'],
      floor: json['floor'],
      korpus: json['korpus'],
    );
  }
}
