class PersonModel {
  final int id;
  final String avatar;
  final String name;
  String time;
  final bool isSender;

  PersonModel(
      {required this.id,
      required this.avatar,
      required this.name,
      required this.time,
      required this.isSender});
}
