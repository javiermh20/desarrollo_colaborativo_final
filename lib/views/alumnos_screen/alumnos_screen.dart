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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF003AE3), Color(0xFF00C0FF)],
          ),
        ),
        child: GetBuilder<AlumnoProvider>(
          builder: (alumnoProvider) {
            final alumnos = alumnoProvider.alumnos;

            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        'Alumnos',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: alumnos.length,
                      itemBuilder: (context, index) {
                        final alumno = alumnos[index];

                        Color tileColor = index.isEven
                            ? const Color(0xFF69A0FF)
                            : const Color(0xFF0077B6);

                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: tileColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            title: Text(
                              alumno.nombre,
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              alumno.apellido,
                              style: const TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              // Acción cuando se selecciona el alumno
                            },
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    // Implementa la lógica para editar el alumno
                                    Get.to(AlumnoCrearScreen(
                                        alumno: alumno, editing: true));
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    // Implementa la lógica para eliminar el alumno
                                    alumnoProvider.deleteAlumno(alumno.id);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding:
            const EdgeInsets.only(bottom: kBottomNavigationBarHeight + 90.0),
        child: FloatingActionButton(
          onPressed: () {
            Get.to(const AlumnoCrearScreen());
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
