part of '../page/form_page.dart';

void _seleccionarFechaNacimiento(BuildContext context, DateTime? fecha) async {
  // Mostrar el DatePicker y esperar a que el usuario seleccione una fecha
  final DateTime? fechaSeleccionada = await showDatePicker(
    context: context,
    initialDate: fecha ?? DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );

  if (fechaSeleccionada != null) {
    Modular.get<FormUserBloc>()
        .add(ChangeDataFormUserEvent(date: fechaSeleccionada));
  }
}
