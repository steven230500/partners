part of 'direccion_bloc.dart';

abstract class DireccionEvent extends Equatable {
  const DireccionEvent();

  @override
  List<Object> get props => [];
}

class AddNewDireccionEvent extends DireccionEvent {
  const AddNewDireccionEvent();
}

class UpdateDireccionEvent extends DireccionEvent {
  final int index;
  final String direccion;

  const UpdateDireccionEvent({
    required this.direccion,
    required this.index,
  });
}

class DeleteDireccionEvent extends DireccionEvent {
  final int index;

  const DeleteDireccionEvent({
    required this.index,
  });
}
