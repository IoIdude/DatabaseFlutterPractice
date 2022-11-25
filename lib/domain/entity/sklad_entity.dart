class SkladEntity {
  late int id;
  final String company_name;
  final String product_name;
  final DateTime date;

  SkladEntity({
    this.id = 0,
    this.company_name = '',
    this.product_name = '',
    required this.date,
  });
}
