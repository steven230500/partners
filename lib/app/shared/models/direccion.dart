class Direccion {
  final String direccion;

  Direccion({
    required this.direccion,
  });

  Map<String, dynamic> toJson() {
    return {
      'direccion': direccion,
    };
  }

  factory Direccion.fromJson(Map<String, dynamic> json) {
    return Direccion(
      direccion: json['direccion'],
    );
  }
  Direccion copyWith({
    String? direccion,
  }) =>
      Direccion(
        direccion: direccion ?? this.direccion,
      );
}
