import 'package:desarrollo_colaborativo_final/core/router/routes_barrel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:desarrollo_colaborativo_final/core/router/app_router.dart';

void main() {
  Get.put(AlumnoProvider());
  Get.put(MateriaProvider());
  Get.put(CalificacionEstudianteProvider());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calificaciones Proyecto Final',
        initialRoute: '/',
        getPages: AppRouter.routes);
  }
}
