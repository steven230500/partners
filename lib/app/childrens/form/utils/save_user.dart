part of '../page/form_page.dart';

void _guardarUsuario(BuildContext context, User? user) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmar datos'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Nombre: ${user?.name ?? ''}'),
            Text('Apellido: ${user?.lastName ?? ''}'),
            Text(
              'Fecha de nacimiento: ${DateFormat('dd/MM/yyyy').format(user?.date ?? DateTime.now())}',
            ),
            if (user?.direcciones != null)
              ...user!.direcciones.map((direccion) {
                return Text(direccion.direccion.toString());
              }).toList(),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cerrar'),
            onPressed: () {
              Modular.to.pop();
            },
          ),
          TextButton(
            child: const Text('Confirmar datos'),
            onPressed: () {
              Modular.get<FormUserBloc>()
                  .add(SaveDataFormUserEvent(user: user));
              Modular.to.pop();
            },
          ),
        ],
      );
    },
  );
}
