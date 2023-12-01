import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_agent/models/student_model/student_model.dart';

class StudentRepository {
  final FirebaseFirestore _firestore;
  StudentRepository(this._firestore);

  CollectionReference<Student> get studentsRef {
    return _firestore.collection('demos')
      .withConverter(
        fromFirestore: (snapshot, _) => Student.fromJson(snapshot.data()!),
        toFirestore: (student, _) => student.toJson()
    );
  }

  Stream<List<Student>> get students {
    return studentsRef.snapshots().map(
            (event) => event.docs.map(
                    (e) => e.data()).toList());
  }
}