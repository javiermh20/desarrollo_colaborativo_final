import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key, Key? key1});

  @override
  // ignore: library_private_types_in_public_api
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _buildBackgroundImage(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 70.0,
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/120158035?s=400&u=445cfac57218d56abc7799b890421035478518d6&v=4',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Javier Mejia',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          'javiermh20@waske.com',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: const Color.fromARGB(
                                255, 208, 210, 211), // Puedes ajustar el color
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: const Text(
                            '¡Bienvenido a mi perfil! Soy un apasionado desarrollador de aplicaciones móviles. Me encanta aprender y compartir conocimientos con la comunidad.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(221, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                  const SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildProfileStat('Proyectos', '25'),
                      _buildProfileStat('Seguidores', '500'),
                      _buildProfileStat('Siguiendo', '100'),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      // Aquí puedes implementar la lógica para cerrar sesión
                      // Por ejemplo, podrías limpiar el estado de autenticación o realizar otras tareas de limpieza.

                      // Después de cerrar sesión, navega a la pantalla de inicio de sesión
                      Get.toNamed(
                          '/login'); // Ajusta la ruta según tu configuración de rutas
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Cerrar Sesión',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return ClipRect(
      child: Align(
        alignment: Alignment.topCenter,
        heightFactor: 1.0,
        child: Container(
          height: 170.0,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage(
                'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
              ),
              fit: BoxFit.cover,
            ),
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          label,
          style: const TextStyle(fontSize: 14.0, color: Colors.grey),
        ),
      ],
    );
  }
}
