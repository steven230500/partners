import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:partnerts/app/childrens/form/bloc/direccion/direccion_bloc.dart';
import 'package:partnerts/app/childrens/form/bloc/form/form_bloc.dart';
import 'package:partnerts/app/childrens/form/widgets/text_field.dart';
import 'package:partnerts/app/shared/models/direccion.dart';
import 'package:partnerts/app/shared/models/user.dart';

part './../widgets/direccion_item.dart';
part './../widgets/list_direccion.dart';
part './../utils/select_date_picker.dart';
part './../utils/save_user.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: Modular.get<FormUserBloc>(),
        ),
        BlocProvider.value(
          value: Modular.get<DireccionBloc>(),
        ),
      ],
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario aliados'),
      ),
      body: BlocListener<FormUserBloc, FormUserState>(
        listener: (context, state) {
          if (state is FormUserSaved) {
            Modular.to.pushNamed('/final');
          }
          if (state is FormUserFailed) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: const Text('No se ha podido registrar el usuario.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Modular.to.pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: BlocBuilder<FormUserBloc, FormUserState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nombre',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      PartnerTextField(
                        labelText: 'Ingrese su nombre',
                        errorText: 'Por favor ingrese su nombre',
                        onChanged: (String value) {
                          Modular.get<FormUserBloc>()
                              .add(ChangeDataFormUserEvent(name: value));
                        },
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Apellido',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      PartnerTextField(
                        labelText: 'Ingrese su apellido',
                        errorText: 'Por favor ingrese su apellido',
                        onChanged: (String value) {
                          Modular.get<FormUserBloc>()
                              .add(ChangeDataFormUserEvent(lastName: value));
                        },
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Fecha de nacimiento',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      PartnerTextField(
                        controller: TextEditingController(
                          text:
                              DateFormat('dd/MM/yyyy').format(state.user.date),
                        ),
                        readOnly: true,
                        labelText: 'Seleccione su fecha de nacimiento',
                        errorText:
                            'Por favor seleccione su fecha de nacimiento',
                        onTap: () => _seleccionarFechaNacimiento(
                          context,
                          state.user.date,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Direcciones',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const ListDireccion(),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          Modular.get<DireccionBloc>()
                              .add(const AddNewDireccionEvent());
                        },
                        child: const Text('Agregar dirección'),
                      ),
                      const SizedBox(height: 20.0),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _guardarUsuario(context, state.user);
                          },
                          child: const Text('Guardar usuario'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
