import 'package:get/get.dart';

class Alumno {
  final String id;
  final String nombre;
  final String apellido;
  final String matricula;
  final String carrera;
  final String semestre;
  final String materias;

  Alumno(
      {required this.id,
      required this.nombre,
      required this.apellido,
      required this.matricula,
      required this.carrera,
      required this.semestre,
      required this.materias});
}

class AlumnoProvider extends GetxController {
  final List<Alumno> _alumnos = [
    Alumno(
      id: '1',
      nombre: 'Juan',
      apellido: 'Perez',
      matricula: '123456',
      carrera: 'Ingenieria en Sistemas',
      semestre: '8',
      materias: '',
    ),
    Alumno(
      id: '2',
      nombre: 'Maria',
      apellido: 'Lopez',
      matricula: '123456',
      carrera: 'Ingenieria en Sistemas',
      semestre: '8',
      materias: '',
    ),
    Alumno(
      id: '3',
      nombre: 'Pedro',
      apellido: 'Gonzalez',
      matricula: '123456',
      carrera: 'Ingenieria en Sistemas',
      semestre: '8',
      materias: '',
    ),
    Alumno(
      id: '4',
      nombre: 'Jose',
      apellido: 'Garcia',
      matricula: '123456',
      carrera: 'Ingenieria en Sistemas',
      semestre: '8',
      materias: '',
    ),
    Alumno(
      id: '5',
      nombre: 'Luis',
      apellido: 'Martinez',
      matricula: '123456',
      carrera: 'Ingenieria en Sistemas',
      semestre: '8',
      materias: '',
    ),
  ];

  List<Alumno> get alumnos {
    return [..._alumnos];
  }

  Alumno findById(String id) {
    return _alumnos.firstWhere((alumno) => alumno.id == id);
  }

  void addAlumno(Alumno alumno) {
    final newAlumno = Alumno(
      id: DateTime.now().toString(),
      nombre: alumno.nombre,
      apellido: alumno.apellido,
      matricula: alumno.matricula,
      carrera: alumno.carrera,
      semestre: alumno.semestre,
      materias: alumno.materias,
    );
    _alumnos.add(newAlumno);
    update();
  }

  void updateAlumno(String id, Alumno alumno) {
    final alumnoIndex = _alumnos.indexWhere((alumno) => alumno.id == id);
    if (alumnoIndex >= 0) {
      _alumnos[alumnoIndex] = Alumno(
        id: id,
        nombre: alumno.nombre,
        apellido: alumno.apellido,
        matricula: alumno.matricula,
        carrera: alumno.carrera,
        semestre: alumno.semestre,
        materias: alumno.materias,
      );
      update();
    } else {
      // print('Ha ocurrido un error');
    }
  }

  void deleteAlumno(String id) {
    _alumnos.removeWhere((alumno) => alumno.id == id);
    update();
  }
}
