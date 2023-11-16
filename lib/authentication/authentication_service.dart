import 'package:flutter/material.dart';

void authenticateUser(
    BuildContext context,
    final TextEditingController usernameController,
    final TextEditingController passwordController) {
  String username = usernameController.text;
  String password = passwordController.text;

  if (username == 'admin' && password == '1234') {
    Navigator.pushReplacementNamed(context, '/menu');
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error de autenticación'),
          content: const Text('El usuario no existe. Vuelve a intentarlo.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
