import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StudentDetailPage extends StatelessWidget {
  final String nombre;
  final String codigo;
  final String genero;
  final String email;
  final String telefono;
  final String fechaNacimiento;

  const StudentDetailPage({
    super.key,
    required this.nombre,
    required this.codigo,
    required this.genero,
    required this.email,
    required this.telefono,
    required this.fechaNacimiento,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle: $nombre')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Nombre del estudiante
            Text(
              nombre,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            /// Código
            Text(
              'Código: $codigo',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Divider(height: 32, thickness: 2),

            /// Información detallada
            _buildInfoRow(Icons.person, 'Género', genero),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.email, 'Email', email),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.phone, 'Teléfono', telefono),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.cake, 'Fecha de nacimiento', fechaNacimiento),

            const Spacer(),

            /// Botón de chat
            Center(
              child: FilledButton.icon(
                onPressed: () => context.push('/student/chat'),
                icon: const Icon(Icons.chat),
                label: const Text('Chat con Tutor'),
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
