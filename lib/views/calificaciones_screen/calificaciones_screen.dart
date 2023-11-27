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
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF003AE3), Color(0xFF00C0FF)],
            ),
          ),
          child: GetBuilder<CalificacionEstudianteProvider>(
            builder: (calificacionEstudianteProvider) {
              final calificaciones =
                  calificacionEstudianteProvider.calificacionesEstudiantes;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        'Calificaciones',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio:
                            1.0, // Asegura que los elementos sean cuadrados
                      ),
                      padding: const EdgeInsets.all(
                          16.0), // Agrega un pequeño espaciado
                      itemCount: calificaciones.length,
                      itemBuilder: (context, index) {
                        final calificacion = calificaciones[index];

                        Color tileColor = index.isEven
                            ? const Color(0xFF69A0FF)
                            : const Color(0xFF0077B6);

                        return GestureDetector(
                          onTap: () {
                            // Acción cuando se selecciona la calificación
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: tileColor,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  calificacion.materia,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  calificacion.calificacion.toString(),
                                  style: const TextStyle(
                                    color: Colors
                                        .amber, // Cambia el color para resaltar la calificación
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        // Implementa la lógica para editar la calificación
                                        Get.to(CalificacionCrearScreen(
                                            calificacion: calificacion,
                                            editing: true));
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        // Implementa la lógica para eliminar la calificación
                                        calificacionEstudianteProvider
                                            .deleteCalificacionEstudiante(
                                                calificacion.id);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding:
            const EdgeInsets.only(bottom: kBottomNavigationBarHeight + 90.0),
        child: FloatingActionButton(
          onPressed: () {
            Get.to(const CalificacionCrearScreen());
          },
          backgroundColor: Colors.white,
          mini: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.black),
          ),
          child: const Icon(Icons.add, color: Colors.black),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
