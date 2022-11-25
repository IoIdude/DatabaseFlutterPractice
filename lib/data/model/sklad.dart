import '../../domain/entity/sklad_entity.dart';

class Sklad extends SkladEntity {
  Sklad({
    super.id,
    required super.company_name,
    required super.product_name,
    required super.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'company_name': company_name,
      'product_name': product_name,
      'date': date,
    };
  }

  factory Sklad.toFromMap(Map<String, dynamic> json) {
    return Sklad(
      id: json['id'] as int,
      company_name: json['company_name'],
      product_name: json['product_name'],
      date: json['date'],
    );
  }
}
