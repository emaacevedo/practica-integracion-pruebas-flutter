import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

abstract class TaskRepository {
  Stream<List<Task>> watchTasks();
  Future<void> create(String title, String description);
  Future<void> update(Task task);
  Future<void> delete(String id);
}

class FirestoreTaskRepository implements TaskRepository {
  FirestoreTaskRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> get _tasks =>
      _db.collection('tasks');

  @override
  Stream<List<Task>> watchTasks() => _tasks.snapshots().map((snapshot) {
        final tasks = snapshot.docs.map((doc) {
          final data = doc.data();
          return Task(
            id: doc.id,
            title: (data['title'] as String?) ?? '',
            description: (data['description'] as String?) ?? '',
            completed: (data['completed'] as bool?) ?? false,
          );
        }).toList();
        tasks.sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
        return tasks;
      });

  @override
  Future<void> create(String title, String description) async {
    await _tasks.add({
      'title': title.trim(),
      'description': description.trim(),
      'completed': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<void> update(Task task) => _tasks.doc(task.id).update({
        'title': task.title.trim(),
        'description': task.description.trim(),
        'completed': task.completed,
      });

  @override
  Future<void> delete(String id) => _tasks.doc(id).delete();
}
