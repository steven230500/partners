part of 'form_bloc.dart';

abstract class FormUserEvent extends Equatable {
  const FormUserEvent();

  @override
  List<Object> get props => [];
}

class ChangeDataFormUserEvent extends FormUserEvent {
  final String name;
  final String lastName;
  final DateTime? date;
  final List<Direccion> direcciones;

  const ChangeDataFormUserEvent({
    this.name = '',
    this.lastName = '',
    this.date,
    this.direcciones = const [],
  });
}

class SaveDataFormUserEvent extends FormUserEvent {
  final User? user;

  const SaveDataFormUserEvent({
    this.user,
  });
}
