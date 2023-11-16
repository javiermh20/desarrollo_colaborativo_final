import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:desarrollo_colaborativo_final/core/router/routes_barrel.dart';

class AlumnosScreen extends StatefulWidget {
  const AlumnosScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AlumnosScreenState createState() => _AlumnosScreenState();
}

class _AlumnosScreenState extends State<AlumnosScreen> {
  AlumnoProvider alumnoProvider = Get.find<AlumnoProvider>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AlumnoProvider>(
        builder: (alumnoProvider) {
          final alumnos = alumnoProvider.alumnos;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Alumnos',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: alumnos.length,
                  itemBuilder: (context, index) {
                    final alumno = alumnos[index];

                    return ListTile(
                      title: Text(alumno.nombre),
                      subtitle: Text(alumno.apellido),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              Get.to(AlumnoCrearScreen(
                                alumno:
                                    alumno, // Pasamos el alumno a la pantalla de edición
                              ));
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // Acción cuando se presiona el botón de eliminar
                              alumnoProvider.deleteAlumno(alumno.id);
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        // Acción cuando se selecciona el alumno
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
          // Puedes abrir una pantalla para agregar un nuevo alumno o realizar otras acciones.
          Get.to(const AlumnoCrearScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
