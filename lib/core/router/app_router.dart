import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:desarrollo_colaborativo_final/core/router/routes_barrel.dart';

class AppRouter {
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: '/',
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: '/menu',
      page: () => const MenuScreen(),
    ),
    GetPage(
      name: '/perfil',
      page: () => const PerfilScreen(),
    ),
    GetPage(
      name: '/alumnos',
      page: () => const AlumnosScreen(),
    ),
    GetPage(name: '/alumno_crear', page: () => const AlumnoCrearScreen()),
    GetPage(name: '/materias', page: () => const MateriasScreen()),
    GetPage(name: '/materia_crear', page: () => const MateriaCrearScreen()),
    GetPage(name: '/calificaciones', page: () => const CalificacionesScreen()),
    GetPage(
        name: '/calificacion_crear',
        page: () => const CalificacionCrearScreen()),
  ];
}
