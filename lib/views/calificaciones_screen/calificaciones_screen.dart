import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:desarrollo_colaborativo_final/core/router/routes_barrel.dart';

class CalificacionesScreen extends StatefulWidget {
  const CalificacionesScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalificacionesScreenState createState() => _CalificacionesScreenState();
}

class _CalificacionesScreenState extends State<CalificacionesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CalificacionEstudianteProvider>(
        builder: (calificacionEstudianteProvider) {
          final calificaciones =
              calificacionEstudianteProvider.calificacionesEstudiantes;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Calificaciones',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: calificaciones.length,
                  itemBuilder: (context, index) {
                    final calificacion = calificaciones[index];

                    return ListTile(
                      title: Text(calificacion.materia),
                      subtitle: Text(calificacion.calificacion.toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              Get.to(CalificacionCrearScreen(
                                calificacion:
                                    calificacion, // Pasamos la calificación a la pantalla de edición
                              ));
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // Acción cuando se presiona el botón de eliminar
                              calificacionEstudianteProvider
                                  .deleteCalificacionEstudiante(
                                      calificacion.id);
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        // Acción cuando se selecciona la calificación
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
          // Puedes abrir una pantalla para agregar una nueva calificación o realizar otras acciones.
          Get.to(const CalificacionCrearScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
