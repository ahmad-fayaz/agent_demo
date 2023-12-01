import 'package:demo_agent/models/student_model/student_model.dart';
import 'package:demo_agent/services/student_service/student_service.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  final StudentService _service;
  StudentController(this._service);

  RxList<Student> students = <Student>[].obs;

  @override
  void onInit() {
    super.onInit();

    _service.students.listen((event) {
      students.value = event;
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

}