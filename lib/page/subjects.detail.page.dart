import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubjectDetailPage extends StatelessWidget {
  final String code;

  const SubjectDetailPage({super.key, required this.code});

  Map<String, Map<String, String>> get _subjectDetails => {
        'PROG001': {
          'Nombre': 'Programación',
          'Código': 'PROG001',
          'Horas': '120',
          'Créditos': '4',
          'Área de conocimiento': 'Ciencias de la Computación',
          'Carrera': 'Ingeniería Informática',
          'Nivel': 'Pregrado',
        },
        'MATE001': {
          'Nombre': 'Matemáticas',
          'Código': 'MATE001',
          'Horas': '90',
          'Créditos': '3',
          'Área de conocimiento': 'Matemáticas',
          'Carrera': 'Ingeniería',
          'Nivel': 'Pregrado',
        },
        'BD001': {
          'Nombre': 'Bases de Datos',
          'Código': 'BD001',
          'Horas': '100',
          'Créditos': '3',
          'Área de conocimiento': 'Sistemas de Información',
          'Carrera': 'Ingeniería Informática',
          'Nivel': 'Pregrado',
        },
        'RED001': {
          'Nombre': 'Redes',
          'Código': 'RED001',
          'Horas': '80',
          'Créditos': '2',
          'Área de conocimiento': 'Telecomunicaciones',
          'Carrera': 'Ingeniería de Redes',
          'Nivel': 'Pregrado',
        },
        'WEB001': {
          'Nombre': 'Diseño Web',
          'Código': 'WEB001',
          'Horas': '100',
          'Créditos': '3',
          'Área de conocimiento': 'Desarrollo Web',
          'Carrera': 'Ingeniería Informática',
          'Nivel': 'Pregrado',
        },
      };

  @override
  Widget build(BuildContext context) {
    final decodedCode = Uri.decodeComponent(code);
    final details = _subjectDetails[decodedCode];

    if (details == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Materia no encontrada')),
        body: const Center(child: Text('No se encontró la materia solicitada')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Materia: ${details['Nombre']}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              details['Nombre']!,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.code, 'Código', details['Código']!),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.book, 'Nombre de la asignatura', details['Nombre']!),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.access_time, 'Número de horas', details['Horas']!),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.school, 'Créditos', details['Créditos']!),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.layers, 'Área de conocimiento', details['Área de conocimiento']!),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.business_center, 'Carrera', details['Carrera']!),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.signal_cellular_alt, 'Nivel', details['Nivel']!),
            const Spacer(),
            Center(
              child: FilledButton.icon(
                onPressed: () => context.push('/chat'),
                icon: const Icon(Icons.chat),
                label: const Text('Chat de la materia'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.indigo),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ],
    );
  }
}
