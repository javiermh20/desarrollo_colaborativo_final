import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/salleSplash.png',
      height: 120.0,
    );
  }
}

class PerfilAvatarWidget extends StatelessWidget {
  final String imageUrl;

  const PerfilAvatarWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70.0,
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}

class PerfilInfoWidget extends StatelessWidget {
  final String username;
  final String email;

  const PerfilInfoWidget({
    super.key,
    required this.username,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          username,
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Correo electrónico: $email',
          style: const TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}

class PerfilDescriptionWidget extends StatelessWidget {
  final String description;

  const PerfilDescriptionWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16.0),
    );
  }
}

class PerfilStatsWidget extends StatelessWidget {
  final String label;
  final String value;

  const PerfilStatsWidget(
      {super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
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
