import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:desarrollo_colaborativo_final/core/router/routes_barrel.dart';

class MateriasScreen extends StatefulWidget {
  const MateriasScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MateriasScreenState createState() => _MateriasScreenState();
}

class _MateriasScreenState extends State<MateriasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MateriaProvider>(
        builder: (materiaProvider) {
          final materias = materiaProvider.materias;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Materias',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: materias.length,
                  itemBuilder: (context, index) {
                    final materia = materias[index];

                    return ListTile(
                      title: Text(materia.nombre),
                      subtitle: Text(materia.profesor),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // Acción cuando se presiona el botón de editar
                              // Abre la pantalla de creación/editar y pasa la materia actual
                              Get.to(MateriaCrearScreen(
                                  materia: materia, editing: true));
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // Acción cuando se presiona el botón de eliminar
                              materiaProvider.deleteMateria(materia.id);
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        // Acción cuando se selecciona la materia
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción cuando se presiona el botón flotante
          // Puedes abrir una pantalla para agregar una nueva materia o realizar otras acciones.
          Get.to(const MateriaCrearScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
