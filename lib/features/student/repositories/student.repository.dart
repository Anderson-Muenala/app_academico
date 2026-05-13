import '../models/student.model.dart';

class StudentRepository {
  /// Simulación de base de datos en memoria
  final List<Student> _students = [
    Student(
      id: 1,
      code: "STU001",
      firstName: "Juan",
      lastName: "Pérez",
      gender: "M",
      birthDate: DateTime(2005, 5, 10),
      email: "juan@email.com",
      phone: "0999999999",
      photoUrl: "",
    ),
    Student(
      id: 2,
      code: "STU002",
      firstName: "María",
      lastName: "Lopez",
      gender: "F",
      birthDate: DateTime(2006, 3, 15),
      email: "maria@email.com",
      phone: "0988888888",
      photoUrl: "",
    ),
    Student(
      id: 3,
      code: "STU003",
      firstName: "Luis",
      lastName: "Muenala",
      gender: "F",
      birthDate: DateTime(2002, 10, 02),
      email: "anderson09real@email.com",
      phone: "0986987661",
      photoUrl: "",
    ),
  ];

  /// GET ALL
  List<Student> getAll() {
    return _students;
  }

  /// GET BY ID
  Student? getById(int id) {
    final filtered = _students.where((s) => s.id == id);
    return filtered.isEmpty ? null : filtered.first;
  }

  /// INSERT
  void add(Student student) {
    _students.add(student);
  }

  /// UPDATE
  void update(Student student) {
    final index = _students.indexWhere((s) => s.id == student.id);
    if (index != -1) {
      _students[index] = student;
    }
  }

  /// DELETE
  void delete(int id) {
    _students.removeWhere((s) => s.id == id);
  }
}
