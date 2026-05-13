import 'package:flutter/material.dart';

class SubjectsChatPage extends StatelessWidget {
  const SubjectsChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat de Materia')),
      body: const Center(child: Text('Espacio de chat para la materia')),
    );
  }
}