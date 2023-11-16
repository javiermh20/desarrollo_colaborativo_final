import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Color de fondo
      body: Center(
        child: Image.asset(
          'assets/img/salleSplash.png', // Asegúrate de usar el nombre correcto de tu imagen
          height: 150.0, // Ajusta la altura según tus preferencias
          width: 150.0, // Ajusta el ancho según tus preferencias
          fit: BoxFit
              .contain, // Ajusta cómo se ajusta la imagen dentro del contenedor
        ),
      ),
    );
  }
}
