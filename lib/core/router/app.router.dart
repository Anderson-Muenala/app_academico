import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../features/student/providers/student.provider.dart';
import '../../features/student/pages/students.page.dart';
import '../../features/student/pages/students.detail.page.dart';
import '../../page/home.page.dart';
import '../../page/chat.page.dart';
import '../../page/profile.page.dart';
import '../../page/subjects.page.dart';
import '../../page/subjects.detail.page.dart';
import '../../widgets/app.shell.widget.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => '/home',
    ),
    ShellRoute(
      builder: (context, state, child) => AppShellWidget(child: child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/students',
          builder: (context, state) => const StudentsPage(),
        ),
        GoRoute(
          path: '/subjects',
          builder: (context, state) => const SubjectsPage(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    ),
    GoRoute(
      path: '/student/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '0';
        final studentId = int.tryParse(id) ?? 0;
        final student = Provider.of<StudentProvider>(context, listen: false).getById(studentId);

        if (student == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Estudiante no encontrado')),
            body: const Center(child: Text('Estudiante no encontrado')),
          );
        }

        return StudentDetailPage(
          nombre: '${student.firstName} ${student.lastName}',
          codigo: student.code,
          genero: student.gender,
          email: student.email,
          telefono: student.phone,
          fechaNacimiento: student.birthDate.toString().split(' ')[0],
        );
      },
    ),
    GoRoute(
      path: '/student/chat',
      builder: (context, state) => const ChatPage(),
    ),
    GoRoute(
      path: '/subject/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return SubjectDetailPage(code: id);
      },
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) => const ChatPage(),
    ),
  ],
);

