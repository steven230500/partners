import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partnerts/app/childrens/form/repository/respository.dart';
import 'package:partnerts/app/shared/models/direccion.dart';
import 'package:partnerts/app/shared/models/user.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormUserBloc extends Bloc<FormUserEvent, FormUserState> {
  final Repository respository;
  FormUserBloc({required this.respository})
      : super(
          FormUserInitial(
            User(
              name: '',
              lastName: '',
              date: DateTime.now(),
              direcciones: [],
            ),
          ),
        ) {
    on<ChangeDataFormUserEvent>((_onChangeData));
    on<SaveDataFormUserEvent>((_onSaveData));
  }

  Future<void> _onSaveData(
    SaveDataFormUserEvent event,
    Emitter<FormUserState> emit,
  ) async {
    if (event.user != null) {
      final response = await respository.guardarUsuarioEnFirestore(event.user!);
      if (response) {
        emit(FormUserSaved(state.user));
      } else {
        emit(FormUserFailed(state.user));
      }
    } else {
      emit(FormUserFailed(state.user));
    }
  }

  void _onChangeData(
    ChangeDataFormUserEvent event,
    Emitter<FormUserState> emit,
  ) {
    User user = User(
      name: event.name != '' ? event.name : state.user.name,
      lastName: event.lastName != '' ? event.lastName : state.user.lastName,
      date: event.date ?? DateTime.now(),
      direcciones:
          event.direcciones != [] ? event.direcciones : state.user.direcciones,
    );
    emit(
      FormUserLoaded(user),
    );
  }
}
