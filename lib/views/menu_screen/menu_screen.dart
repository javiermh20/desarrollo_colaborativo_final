import 'package:desarrollo_colaborativo_final/core/router/routes_barrel.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

enum _SelectedTab { materia, alumnos, calificaciones, perfil }

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  _SelectedTab _selectedTab = _SelectedTab.materia;

  @override
  void initState() {
    super.initState();
  }

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedTab = _SelectedTab.values[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _SelectedTab.values.indexOf(_selectedTab),
          children: const [
            /// Materias
            MateriasScreen(),

            /// Alumnos
            AlumnosScreen(),

            /// Calificaciones
            CalificacionesScreen(),

            /// Perfil
            PerfilScreen()
          ],
        ),
      ),
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        items: [
          /// Materias
          DotNavigationBarItem(
            icon: const Icon(Icons.book),
            selectedColor: Colors.blue,
          ),

          /// Alumnos
          DotNavigationBarItem(
            icon: const Icon(Icons.group),
            selectedColor: Colors.blue,
          ),

          /// Calificaciones
          DotNavigationBarItem(
            icon: const Icon(Icons.date_range),
            selectedColor: Colors.blue,
          ),

          /// Perfil
          DotNavigationBarItem(
            icon: const Icon(Icons.person),
            selectedColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
