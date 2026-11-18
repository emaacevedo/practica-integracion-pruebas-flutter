import 'dart:async';
import 'package:practica_integracion_pruebas_flutter/data/firestore_task_repository.dart';
import 'package:practica_integracion_pruebas_flutter/models/task.dart';

class FakeTaskRepository implements TaskRepository {
  final List<Task> tasks = [];
  final StreamController<List<Task>> _controller = StreamController.broadcast();
  int createCalls = 0;

  @override
  Stream<List<Task>> watchTasks() async* {
    yield List.of(tasks);
    yield* _controller.stream;
  }

  void _emit() => _controller.add(List.of(tasks));

  @override
  Future<void> create(String title, String description) async {
    createCalls++;
    tasks.add(Task(
      id: '${tasks.length + 1}',
      title: title,
      description: description,
      completed: false,
    ));
    _emit();
  }

  @override
  Future<void> update(Task task) async {
    final index = tasks.indexWhere((element) => element.id == task.id);
    if (index >= 0) tasks[index] = task;
    _emit();
  }

  @override
  Future<void> delete(String id) async {
    tasks.removeWhere((task) => task.id == id);
    _emit();
  }

  Future<void> dispose() => _controller.close();
}
