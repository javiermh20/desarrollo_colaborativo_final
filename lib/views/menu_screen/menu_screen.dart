import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

import '../alumnos_screen/alumnos_screen.dart';
import '../calificaciones_screen/calificaciones_screen.dart';
import '../materias_screen/materias_screen.dart';
import '../perfil_screen/perfil_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(
              index: _currentIndex,
              children: const [
                MateriasScreen(),
                AlumnosScreen(),
                CalificacionesScreen(),
                PerfilScreen(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: DotNavigationBar(
                paddingR:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.all(12.0),
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  DotNavigationBarItem(
                    icon: const Icon(Icons.book, color: Colors.black),
                    selectedColor: Colors.black,
                  ),
                  DotNavigationBarItem(
                    icon: const Icon(Icons.group, color: Colors.black),
                    selectedColor: Colors.black,
                  ),
                  DotNavigationBarItem(
                    icon: const Icon(Icons.date_range, color: Colors.black),
                    selectedColor: Colors.black,
                  ),
                  DotNavigationBarItem(
                    icon: const Icon(Icons.person, color: Colors.black),
                    selectedColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
