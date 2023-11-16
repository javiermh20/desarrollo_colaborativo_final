import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:desarrollo_colaborativo_final/core/router/routes_barrel.dart';

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

    // Preenlaza los datos de la materia si se proporciona una materia
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(
              controller: descripcionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            TextFormField(
              controller: profesorController,
              decoration: const InputDecoration(labelText: 'Profesor'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el botón de guardar
                if (widget.editing) {
                  // Si estamos editando, actualiza la materia existente
                  editarMateria();
                } else {
                  // Si no estamos editando, agrega una nueva materia
                  guardarMateria();
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
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
        ));

    Get.back();
  }
}
