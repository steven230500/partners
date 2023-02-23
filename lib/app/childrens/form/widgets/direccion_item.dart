part of '../page/form_page.dart';

class DireccionItem extends StatelessWidget {
  final int index;
  final Direccion direccion;
  final void Function() onSaved;

  const DireccionItem({
    Key? key,
    required this.index,
    required this.direccion,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dirección ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: direccion.direccion,
                decoration: InputDecoration(
                  labelText: 'Ingrese una direccion',
                  labelStyle: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Ingrese una direccion';
                  }
                  return null;
                },
                onChanged: (value) {
                  Modular.get<DireccionBloc>().add(
                    UpdateDireccionEvent(
                      direccion: value,
                      index: index,
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: const Text('Eliminar'),
                    onPressed: () {
                      Modular.get<DireccionBloc>().add(
                        DeleteDireccionEvent(
                          index: index,
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Guardar'),
                    onPressed: () {
                      onSaved();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
