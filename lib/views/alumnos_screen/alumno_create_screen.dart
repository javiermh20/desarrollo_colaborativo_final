import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:desarrollo_colaborativo_final/core/router/routes_barrel.dart';

class AlumnoCrearScreen extends StatefulWidget {
  final Alumno? alumno; // Recibe el alumno como parámetro

  const AlumnoCrearScreen({super.key, this.alumno});

  @override
  // ignore: library_private_types_in_public_api
  _AlumnoCrearScreenState createState() => _AlumnoCrearScreenState();
}

class _AlumnoCrearScreenState extends State<AlumnoCrearScreen> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController matriculaController = TextEditingController();
  final TextEditingController carreraController = TextEditingController();
  final TextEditingController semestreController = TextEditingController();
  final TextEditingController materiasController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Llenamos los controladores con los datos del alumno si se proporciona
    if (widget.alumno != null) {
      nombreController.text = widget.alumno!.nombre;
      apellidoController.text = widget.alumno!.apellido;
      matriculaController.text = widget.alumno!.matricula;
      carreraController.text = widget.alumno!.carrera;
      semestreController.text = widget.alumno!.semestre;
      materiasController.text = widget.alumno!.materias;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar/Editar Alumno'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: nombreController,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              TextFormField(
                controller: apellidoController,
                decoration: const InputDecoration(labelText: 'Apellido'),
              ),
              TextFormField(
                controller: matriculaController,
                decoration: const InputDecoration(labelText: 'Matrícula'),
              ),
              TextFormField(
                controller: carreraController,
                decoration: const InputDecoration(labelText: 'Carrera'),
              ),
              TextFormField(
                controller: semestreController,
                decoration: const InputDecoration(labelText: 'Semestre'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: materiasController,
                decoration: const InputDecoration(labelText: 'Materias'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Acción cuando se presiona el botón de guardar
                  guardarAlumno();
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void guardarAlumno() {
    final String nombre = nombreController.text;
    final String apellido = apellidoController.text;
    final String matricula = matriculaController.text;
    final String carrera = carreraController.text;
    final int semestre = int.tryParse(semestreController.text) ?? 0;
    final String materias = materiasController.text;

    // Realiza la lógica para guardar el alumno aquí.
    // Puedes usar tu AlumnoProvider o el método que prefieras.

    // Ejemplo de cómo podrías usar el provider (asegúrate de tenerlo registrado en GetIt).
    final AlumnoProvider alumnoProvider = Get.find();

    // Verificamos si estamos editando o agregando un nuevo alumno
    if (widget.alumno == null) {
      // Agregar nuevo alumno
      alumnoProvider.addAlumno(Alumno(
        id: DateTime.now().toString(),
        nombre: nombre,
        apellido: apellido,
        matricula: matricula,
        carrera: carrera,
        semestre: semestre.toString(),
        materias: materias,
      ));
    } else {
      // Editar alumno existente
      alumnoProvider.updateAlumno(
          widget.alumno!.id,
          Alumno(
            id: widget.alumno!.id,
            nombre: nombre,
            apellido: apellido,
            matricula: matricula,
            carrera: carrera,
            semestre: semestre.toString(),
            materias: materias,
          ));
    }

    // Cierra la pantalla actual después de guardar el alumno.
    Get.back();
  }
}
