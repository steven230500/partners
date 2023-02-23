import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partnerts/app/shared/models/direccion.dart';

part 'direccion_event.dart';
part 'direccion_state.dart';

class DireccionBloc extends Bloc<DireccionEvent, DireccionState> {
  DireccionBloc() : super(const DireccionInitial([])) {
    on<AddNewDireccionEvent>(_addNewDireccion);
    on<UpdateDireccionEvent>(_updateDireccion);
    on<DeleteDireccionEvent>(_deleteDireccion);
  }

  void _addNewDireccion(
    AddNewDireccionEvent event,
    Emitter<DireccionState> emit,
  ) {
    List<Direccion> direcciones = [];

    if (state.listDireccion.isNotEmpty) {
      direcciones.addAll(state.listDireccion);
    }
    direcciones.add(
      Direccion(direccion: ''),
    );

    emit(DireccionLoaded(direcciones));
  }

  void _updateDireccion(
    UpdateDireccionEvent event,
    Emitter<DireccionState> emit,
  ) {
    if (event.index != -1) {
      Direccion direccion =
          state.listDireccion[event.index].copyWith(direccion: event.direccion);

      List<Direccion> direcciones = [];
      if (state.listDireccion.isNotEmpty) {
        direcciones.addAll(state.listDireccion);
      }
      direcciones[event.index] = direccion;

      emit(DireccionLoaded(direcciones));
    } else {
      emit(
        DireccionFailed(state.listDireccion),
      );
    }
  }

  void _deleteDireccion(
    DeleteDireccionEvent event,
    Emitter<DireccionState> emit,
  ) {
    if (event.index != -1) {
      List<Direccion> direcciones = [];
      if (state.listDireccion.isNotEmpty) {
        direcciones.addAll(state.listDireccion);
      }
      direcciones.removeAt(event.index);
      emit(
        DireccionLoaded(direcciones),
      );
    } else {
      emit(
        DireccionFailed(state.listDireccion),
      );
    }
  }
}
