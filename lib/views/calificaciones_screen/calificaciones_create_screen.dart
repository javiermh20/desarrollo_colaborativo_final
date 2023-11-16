import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:desarrollo_colaborativo_final/core/router/routes_barrel.dart';

class CalificacionCrearScreen extends StatefulWidget {
  final CalificacionEstudiante?
      calificacion; // Recibe la calificación como parámetro

  const CalificacionCrearScreen({super.key, this.calificacion});

  @override
  // ignore: library_private_types_in_public_api
  _CalificacionCrearScreenState createState() =>
      _CalificacionCrearScreenState();
}

class _CalificacionCrearScreenState extends State<CalificacionCrearScreen> {
  final TextEditingController idAlumnoController = TextEditingController();
  final TextEditingController materiaController = TextEditingController();
  final TextEditingController calificacionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Llenamos los controladores con los datos de la calificación si se proporciona
    if (widget.calificacion != null) {
      idAlumnoController.text = widget.calificacion!.idAlumno.toString();
      materiaController.text = widget.calificacion!.materia;
      calificacionController.text =
          widget.calificacion!.calificacion.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar/Editar Calificación'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: idAlumnoController,
              decoration: const InputDecoration(labelText: 'ID del Alumno'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: materiaController,
              decoration: const InputDecoration(labelText: 'Materia'),
            ),
            TextFormField(
              controller: calificacionController,
              decoration: const InputDecoration(labelText: 'Calificación'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el botón de guardar
                guardarCalificacion();
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }

  void guardarCalificacion() {
    final int idAlumno = int.tryParse(idAlumnoController.text) ?? 0;
    final String materia = materiaController.text;
    final double calificacion =
        double.tryParse(calificacionController.text) ?? 0.0;

    // Realiza la lógica para guardar la calificación aquí.
    // Puedes usar tu CalificacionEstudianteProvider o el método que prefieras.

    // Ejemplo de cómo podrías usar el provider (asegúrate de tenerlo registrado en GetIt).
    final CalificacionEstudianteProvider calificacionProvider = Get.find();

    // Verificamos si estamos editando o agregando una nueva calificación
    if (widget.calificacion == null) {
      // Agregar nueva calificación
      calificacionProvider.addCalificacionEstudiante(CalificacionEstudiante(
        id: idAlumno,
        idAlumno: idAlumno,
        materia: materia,
        calificacion: calificacion.toInt(),
      ));
    } else {
      // Editar calificación existente
      calificacionProvider.updateCalificacionEstudiante(CalificacionEstudiante(
        id: widget.calificacion!.id,
        idAlumno: idAlumno,
        materia: materia,
        calificacion: calificacion.toInt(),
      ));
    }

    // Cierra la pantalla actual después de guardar la calificación.
    Get.back();
  }
}
