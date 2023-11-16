import 'package:get/get.dart';

class Materia {
  String id;
  String nombre;
  String descripcion;
  String profesor;

  Materia({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.profesor,
  });
}

class MateriaProvider extends GetxController {
  final List<Materia> _materias = [
    Materia(
      id: '1',
      nombre: 'Programacion I',
      descripcion: 'Programacion I',
      profesor: 'Ing. Juan Perez',
    ),
    Materia(
      id: '2',
      nombre: 'Programacion II',
      descripcion: 'Programacion II',
      profesor: 'Ing. Juan Perez',
    ),
    Materia(
      id: '3',
      nombre: 'Programacion III',
      descripcion: 'Programacion III',
      profesor: 'Ing. Juan Perez',
    ),
    Materia(
      id: '4',
      nombre: 'Programacion IV',
      descripcion: 'Programacion IV',
      profesor: 'Ing. Juan Perez',
    ),
    Materia(
      id: '5',
      nombre: 'Programacion V',
      descripcion: 'Programacion V',
      profesor: 'Ing. Juan Perez',
    ),
  ];

  List<Materia> get materias {
    return [..._materias];
  }

  Materia findById(String id) {
    return _materias.firstWhere((materia) => materia.id == id);
  }

  void addMateria(Materia materia) {
    final newMateria = Materia(
      id: DateTime.now().toString(),
      nombre: materia.nombre,
      descripcion: materia.descripcion,
      profesor: materia.profesor,
    );
    _materias.add(newMateria);
    update(); // Asegura que los widgets que están escuchando se actualicen.
  }

  void updateMateria(String id, Materia newMateria) {
    final materiaIndex = _materias.indexWhere((materia) => materia.id == id);
    if (materiaIndex >= 0) {
      _materias[materiaIndex] = newMateria;
      update(); // Asegura que los widgets que están escuchando se actualicen.
    } else {
      // print('...');
    }
  }

  void deleteMateria(String id) {
    _materias.removeWhere((materia) => materia.id == id);
    update(); // Asegura que los widgets que están escuchando se actualicen.
  }
}
