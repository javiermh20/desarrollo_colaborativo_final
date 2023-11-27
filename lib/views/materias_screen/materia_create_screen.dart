import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:desarrollo_colaborativo_final/models/materia.dart';

class MateriaCrearScreen extends StatefulWidget {
  final Materia? materia;
  final bool editing;

  const MateriaCrearScreen({super.key, this.materia, this.editing = false});

  @override
  // ignore: library_private_types_in_public_api
  _MateriaCrearScreenState createState() => _MateriaCrearScreenState();
}

class _MateriaCrearScreenState extends State<MateriaCrearScreen> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController profesorController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.materia != null) {
      final materia = widget.materia!;
      nombreController.text = materia.nombre;
      descripcionController.text = materia.descripcion;
      profesorController.text = materia.profesor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.editing ? 'Editar Materia' : 'Agregar Materia'),
      ),
      body: Container(
        color: Colors.lightBlue, // Cambia el color de fondo aquí
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(
              controller: nombreController,
              label: 'Nombre',
              icon: Icons.school,
              fillColor: Colors.white,
            ),
            const SizedBox(height: 16.0),
            _buildTextField(
              controller: descripcionController,
              label: 'Descripción',
              maxLines: 3,
              icon: Icons.description,
              fillColor: Colors.white,
            ),
            const SizedBox(height: 16.0),
            _buildTextField(
              controller: profesorController,
              label: 'Profesor',
              icon: Icons.person,
              fillColor: Colors.white,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                if (widget.editing) {
                  editarMateria();
                } else {
                  guardarMateria();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Guardar',
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
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
    int maxLines = 1,
    IconData? icon,
    required Color fillColor,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(fontSize: 16.0),
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

  void guardarMateria() {
    final materiaProvider = Get.find<MateriaProvider>();

    final String nombre = nombreController.text;
    final String descripcion = descripcionController.text;
    final String profesor = profesorController.text;

    materiaProvider.addMateria(Materia(
      id: DateTime.now().toString(),
      nombre: nombre,
      descripcion: descripcion,
      profesor: profesor,
    ));

    Get.back();
  }

  void editarMateria() {
    final materiaProvider = Get.find<MateriaProvider>();

    final String nombre = nombreController.text;
    final String descripcion = descripcionController.text;
    final String profesor = profesorController.text;

    materiaProvider.updateMateria(
      widget.materia!.id,
      Materia(
        id: widget.materia!.id,
        nombre: nombre,
        descripcion: descripcion,
        profesor: profesor,
      ),
    );

    Get.back();
  }
}
