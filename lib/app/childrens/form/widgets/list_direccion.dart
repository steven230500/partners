part of '../page/form_page.dart';

class ListDireccion extends StatelessWidget {
  const ListDireccion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DireccionBloc, DireccionState>(
      builder: (context, state) {
        return Column(
          children: state.listDireccion.map((direccion) {
            return DireccionItem(
              direccion: direccion,
              index: state.listDireccion.indexOf(direccion),
              onSaved: () => Modular.get<FormUserBloc>().add(
                ChangeDataFormUserEvent(direcciones: state.listDireccion),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
