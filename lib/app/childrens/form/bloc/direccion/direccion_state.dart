part of 'direccion_bloc.dart';

abstract class DireccionState extends Equatable {
  final List<Direccion> listDireccion;

  const DireccionState(this.listDireccion);

  @override
  List<Object> get props => [
        listDireccion,
      ];
}

class DireccionInitial extends DireccionState {
  const DireccionInitial(
    List<Direccion> listDireccion,
  ) : super(
          listDireccion,
        );
}

class DireccionFailed extends DireccionState {
  const DireccionFailed(
    List<Direccion> listDireccion,
  ) : super(
          listDireccion,
        );
}

class DireccionLoaded extends DireccionState {
  const DireccionLoaded(
    List<Direccion> listDireccion,
  ) : super(
          listDireccion,
        );
}
