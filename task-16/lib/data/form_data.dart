import '/screens/registration_screen.dart';

class FormData {
  final Pet pet;
  final String name;
  final String dateBirth;
  final int weight;
  final String email;
  final List<Vaccine>? vaccines;

  FormData({
    required this.pet,
    required this.dateBirth,
    required this.email,
    this.vaccines,
    required this.name,
    required this.weight,
  });
}