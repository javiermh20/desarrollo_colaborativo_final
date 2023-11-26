import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:desarrollo_colaborativo_final/core/router/routes_barrel.dart';

class AlumnoCrearScreen extends StatefulWidget {
  final Alumno? alumno;

  const AlumnoCrearScreen({Key? key, this.alumno}) : super(key: key);

  @override
  _AlumnoCrearScreenState createState() => _AlumnoCrearScreenState();
}

class _AlumnoCrearScreenState extends State<AlumnoCrearScreen> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController matriculaController = TextEditingController();
  final TextEditingController carreraController = TextEditingController();
  final TextEditingController semestreController = TextEditingController();
  final TextEditingController materiasController = TextEditingController();
  final TextEditingController fotoUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.alumno != null) {
      final alumno = widget.alumno!;
      nombreController.text = alumno.nombre;
      apellidoController.text = alumno.apellido;
      matriculaController.text = alumno.matricula;
      carreraController.text = alumno.carrera;
      semestreController.text = alumno.semestre;
      materiasController.text = alumno.materias;
      fotoUrlController.text = alumno.fotoUrl;
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
              TextFormField(
                controller: fotoUrlController,
                decoration: const InputDecoration(labelText: 'URL de la Foto'),
              ),
              ElevatedButton(
                onPressed: () {
                  cargarFoto();
                },
                child: const Text('Cargar Foto'),
              ),
              if (fotoUrlController.text.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(fotoUrlController.text),
                  ),
                ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
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

  Future<void> cargarFoto() async {
    // Lógica para cargar la foto
    // Puedes implementar la carga de imágenes aquí utilizando ImagePicker u otro método.
  }

  void guardarAlumno() {
    final String nombre = nombreController.text;
    final String apellido = apellidoController.text;
    final String matricula = matriculaController.text;
    final String carrera = carreraController.text;
    final int semestre = int.tryParse(semestreController.text) ?? 0;
    final String materias = materiasController.text;
    final String fotoUrl = fotoUrlController.text;

    final AlumnoProvider alumnoProvider = Get.find();
    if (widget.alumno == null) {
      alumnoProvider.addAlumno(Alumno(
        id: DateTime.now().toString(),
        nombre: nombre,
        apellido: apellido,
        matricula: matricula,
        carrera: carrera,
        semestre: semestre.toString(),
        materias: materias,
        fotoUrl: fotoUrl,
      ));
    } else {
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
          fotoUrl: fotoUrl,
        ),
      );
    }

    Get.back();
  }
}
