import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_agent/controllers/student_controller/student_controller.dart';
import 'package:demo_agent/repositories/student_repository/student_repository.dart';
import 'package:demo_agent/services/student_service/student_service.dart';
import 'package:get/get.dart';

class StudentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseFirestore>(() => FirebaseFirestore.instance);

    Get.lazyPut<StudentRepository>(() => StudentRepository(Get.find()));
    Get.lazyPut<StudentService>(() => StudentService(Get.find()));

    Get.lazyPut<StudentController>(() => StudentController(Get.find()));
  }

}