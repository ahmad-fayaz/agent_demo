import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_agent/bindings/students_bindings/student_bindings.dart';
import 'package:demo_agent/controllers/student_controller/student_controller.dart';
import 'package:demo_agent/firebase_options.dart';
import 'package:demo_agent/models/student_model/student_model.dart';
import 'package:demo_agent/repositories/student_repository/student_repository.dart';
import 'package:demo_agent/services/student_service/student_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  StudentBindings().dependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends GetView<StudentController> {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.students.length,
            itemBuilder: (context, index) {
              final student = controller.students[index];
              return ListTile(title: Text(student.name), subtitle: Text(student.usn),);
            }),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
