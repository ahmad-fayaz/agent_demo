import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_agent/models/student_model/student_model.dart';
import 'package:demo_agent/repositories/student_repository/student_repository.dart';

class StudentService {
  final StudentRepository _repository;
  StudentService(this._repository);

  CollectionReference<Student> get studentsRef {
    return _repository.studentsRef;
  }

  Stream<List<Student>> get students => _repository.students;
}