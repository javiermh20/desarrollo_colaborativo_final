import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:desarrollo_colaborativo_final/core/router/routes_barrel.dart';

class CalificacionCrearScreen extends StatefulWidget {
  final CalificacionEstudiante? calificacion;
  final bool editing;

  const CalificacionCrearScreen(
      {super.key, this.calificacion, this.editing = false});

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
      body: Container(
        color: Colors.lightBlue,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(
              controller: idAlumnoController,
              label: 'ID del Alumno',
              keyboardType: TextInputType.number,
              icon: Icons.person,
              fillColor: Colors.white,
            ),
            const SizedBox(height: 16.0),
            _buildTextField(
              controller: materiaController,
              label: 'Materia',
              icon: Icons.book,
              fillColor: Colors.white,
            ),
            const SizedBox(height: 16.0),
            _buildTextField(
              controller: calificacionController,
              label: 'Calificación',
              keyboardType: TextInputType.number,
              icon: Icons.star,
              fillColor: Colors.white,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                guardarCalificacion();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 24.0,
                ),
              ),
              child: const Text(
                'Guardar',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    IconData? icon,
    TextInputType? keyboardType,
    required Color fillColor,
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(fontSize: 16.0),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon != null ? Icon(icon, size: 24.0) : null,
        fillColor: fillColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsets.all(16.0),
      ),
    );
  }

  void guardarCalificacion() {
    final int idAlumno = int.tryParse(idAlumnoController.text) ?? 0;
    final String materia = materiaController.text;
    final double calificacion =
        double.tryParse(calificacionController.text) ?? 0.0;

    final CalificacionEstudianteProvider calificacionProvider = Get.find();

    if (widget.calificacion == null) {
      calificacionProvider.addCalificacionEstudiante(CalificacionEstudiante(
        id: idAlumno,
        idAlumno: idAlumno,
        materia: materia,
        calificacion: calificacion.toInt(),
      ));
    } else {
      calificacionProvider.updateCalificacionEstudiante(
        CalificacionEstudiante(
          id: widget.calificacion!.id,
          idAlumno: idAlumno,
          materia: materia,
          calificacion: calificacion.toInt(),
        ),
      );
    }

    Get.back();
  }
}
