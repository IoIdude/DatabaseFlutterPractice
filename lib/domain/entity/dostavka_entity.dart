class DostavkaEntity {
  late int id;
  final int number_of_house;
  final String name_street;
  final int floor;
  final int korpus;

  DostavkaEntity({
    this.id = 0,
    required this.number_of_house,
    required this.name_street,
    required this.floor,
    required this.korpus,
  });
}
