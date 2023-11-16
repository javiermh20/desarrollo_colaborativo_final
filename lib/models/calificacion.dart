import 'package:get/get.dart';

class CalificacionEstudiante {
  int id;
  int idAlumno;
  String materia;
  int calificacion;

  CalificacionEstudiante({
    required this.id,
    required this.idAlumno,
    required this.materia,
    required this.calificacion,
  });
}

class CalificacionEstudianteProvider extends GetxController {
  final List<CalificacionEstudiante> _calificacionesEstudiantes = [
    CalificacionEstudiante(
      id: 1,
      idAlumno: 1,
      materia: 'Web',
      calificacion: 10,
    ),
    CalificacionEstudiante(
      id: 2,
      idAlumno: 1,
      materia: 'Paradigmas',
      calificacion: 10,
    ),
    CalificacionEstudiante(
      id: 3,
      idAlumno: 1,
      materia: 'Programacion III',
      calificacion: 10,
    ),
    CalificacionEstudiante(
      id: 4,
      idAlumno: 1,
      materia: 'ProgramacionII',
      calificacion: 10,
    ),
    CalificacionEstudiante(
      id: 5,
      idAlumno: 1,
      materia: 'Programacion',
      calificacion: 10,
    ),
    CalificacionEstudiante(
      id: 6,
      idAlumno: 2,
      materia: 'IOS',
      calificacion: 10,
    ),
    CalificacionEstudiante(
      id: 7,
      idAlumno: 2,
      materia: 'Android',
      calificacion: 10,
    ),
    CalificacionEstudiante(
      id: 8,
      idAlumno: 2,
      materia: 'IOS',
      calificacion: 10,
    ),
  ];

  List<CalificacionEstudiante> get calificacionesEstudiantes {
    return [..._calificacionesEstudiantes];
  }

  CalificacionEstudiante findById(int id) {
    return _calificacionesEstudiantes.firstWhere(
        (calificacionEstudiante) => calificacionEstudiante.id == id);
  }

  void addCalificacionEstudiante(
      CalificacionEstudiante calificacionEstudiante) {
    final newCalificacionEstudiante = CalificacionEstudiante(
      id: DateTime.now().microsecondsSinceEpoch,
      idAlumno: calificacionEstudiante.idAlumno,
      materia: calificacionEstudiante.materia,
      calificacion: calificacionEstudiante.calificacion,
    );

    _calificacionesEstudiantes.add(newCalificacionEstudiante);
    update();
  }

  void updateCalificacionEstudiante(
      CalificacionEstudiante calificacionEstudiante) {
    final index = _calificacionesEstudiantes.indexWhere(
        (calificacionEstudiante) =>
            calificacionEstudiante.id == calificacionEstudiante.id);

    if (index >= 0) {
      _calificacionesEstudiantes[index] = calificacionEstudiante;
      update();
    }
  }

  void deleteCalificacionEstudiante(int id) {
    _calificacionesEstudiantes.removeWhere(
        (calificacionEstudiante) => calificacionEstudiante.id == id);
    update();
  }
}
