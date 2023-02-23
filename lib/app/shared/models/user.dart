import 'package:partnerts/app/shared/models/direccion.dart';

class User {
  final String name;
  final String lastName;
  final DateTime date;
  final List<Direccion> direcciones;

  User({
    required this.name,
    required this.lastName,
    required this.date,
    required this.direcciones,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastName': lastName,
      'date': date,
      'direciones': List<dynamic>.from(direcciones.map((x) => x.toJson())),
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      lastName: json['lastName'] ?? '',
      date: json['date'] ?? DateTime.now(),
      direcciones: json['direcciones'] ?? [],
    );
  }
  User copyWith({
    String? name,
    String? lastName,
    DateTime? date,
    List<Direccion>? direcciones,
  }) =>
      User(
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        date: date ?? this.date,
        direcciones: direcciones ?? this.direcciones,
      );
}
