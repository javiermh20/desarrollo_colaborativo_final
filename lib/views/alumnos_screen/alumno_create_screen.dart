import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:desarrollo_colaborativo_final/models/alumno.dart';

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
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.lightBlue, // Cambia el color de fondo aquí
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildTextField(
                      controller: nombreController,
                      label: 'Nombre',
                      icon: Icons.person,
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 16.0),
                    _buildTextField(
                      controller: apellidoController,
                      label: 'Apellido',
                      icon: Icons.person,
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 16.0),
                    _buildTextField(
                      controller: matriculaController,
                      label: 'Matrícula',
                      icon: Icons.format_list_numbered,
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 16.0),
                    _buildTextField(
                      controller: carreraController,
                      label: 'Carrera',
                      icon: Icons.school,
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 16.0),
                    _buildTextField(
                      controller: semestreController,
                      label: 'Semestre',
                      icon: Icons.calendar_today,
                      keyboardType: TextInputType.number,
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 16.0),
                    _buildTextField(
                      controller: materiasController,
                      label: 'Materias',
                      icon: Icons.book,
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 16.0),
                    _buildTextField(
                      controller: fotoUrlController,
                      label: 'URL de la Foto',
                      icon: Icons.image,
                      fillColor: Colors.white,
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        cargarFoto();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal:
                              24.0, // Ajusta el padding horizontal según sea necesario
                        ),
                      ),
                      child: const Text(
                        'Cargar Foto',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
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
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal:
                              24.0, // Ajusta el padding horizontal según sea necesario
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    IconData? icon,
    TextInputType? keyboardType,
    required Color fillColor,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
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
