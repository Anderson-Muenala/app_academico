import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Subject {
  final String code;
  final String name;
  final int hours;
  final int credits;
  final String area;
  final String career;
  final String level;

  const Subject({
    required this.code,
    required this.name,
    required this.hours,
    required this.credits,
    required this.area,
    required this.career,
    required this.level,
  });
}

class SubjectsPage extends StatelessWidget {
  const SubjectsPage({super.key});

  static const subjects = <Subject>[
    Subject(
      code: 'PROG001',
      name: 'Programación',
      hours: 120,
      credits: 4,
      area: 'Ciencias de la Computación',
      career: 'Ingeniería Informática',
      level: 'Pregrado',
    ),
    Subject(
      code: 'MATE001',
      name: 'Matemáticas',
      hours: 90,
      credits: 3,
      area: 'Matemáticas',
      career: 'Ingeniería',
      level: 'Pregrado',
    ),
    Subject(
      code: 'BD001',
      name: 'Bases de Datos',
      hours: 100,
      credits: 3,
      area: 'Sistemas de Información',
      career: 'Ingeniería Informática',
      level: 'Pregrado',
    ),
    Subject(
      code: 'RED001',
      name: 'Redes',
      hours: 80,
      credits: 2,
      area: 'Telecomunicaciones',
      career: 'Ingeniería de Redes',
      level: 'Pregrado',
    ),
    Subject(
      code: 'WEB001',
      name: 'Diseño Web',
      hours: 100,
      credits: 3,
      area: 'Desarrollo Web',
      career: 'Ingeniería Informática',
      level: 'Pregrado',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: subjects.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final subject = subjects[index];
        return _SubjectCard(subject: subject);
      },
    );
  }
}

class _SubjectCard extends StatelessWidget {
  final Subject subject;

  const _SubjectCard({required this.subject});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/subject/${Uri.encodeComponent(subject.code)}'),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Container(
                  color: Colors.indigo.shade100,
                  child: const Icon(Icons.book, size: 70, color: Colors.indigo),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text('Código: ${subject.code}', style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text('Créditos: ${subject.credits}', style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
