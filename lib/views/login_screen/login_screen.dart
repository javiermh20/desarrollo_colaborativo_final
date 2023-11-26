import 'package:flutter/material.dart';
import 'package:desarrollo_colaborativo_final/core/router/routes_barrel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF003AE3), Color(0xFF00C0FF)], // Cambia estos colores según tus preferencias
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 24.0),
              Container(
                padding: const EdgeInsets.all(16.0), // Padding para los elementos internos
                decoration: BoxDecoration(
                  color: Colors.white, // Fondo blanco para la sección de la imagen y los TextField
                  borderRadius: BorderRadius.circular(12.0), // Bordes redondeados
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Alinea los elementos internos en el centro
                  children: [
                    const LogoWidget(),
                    const SizedBox(height: 24.0),
                    UsernameTextField(controller: _usernameController),
                    const SizedBox(height: 16.0),
                    PasswordTextField(controller: _passwordController),
                  ],
                ),
              ),

              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  authenticateUser(
                      context, _usernameController, _passwordController);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Center(
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
