import 'package:flutter/material.dart';
import '../data/firestore_task_repository.dart';
import '../models/task.dart';
import 'task_form_screen.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key, required this.repository});
  final TaskRepository repository;

  Future<void> _toggle(BuildContext context, Task task) async {
    try {
      await repository.update(task.copyWith(completed: !task.completed));
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo actualizar la tarea')),
        );
      }
    }
  }

  Future<void> _delete(BuildContext context, Task task) async {
    try {
      await repository.delete(task.id);
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo eliminar la tarea')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Mis tareas')),
        body: StreamBuilder<List<Task>>(
          stream: repository.watchTasks(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Error al cargar tareas. Verifica tu conexión.'));
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final tasks = snapshot.data!;
            if (tasks.isEmpty) {
              return const Center(child: Text('No hay tareas. Crea la primera.'));
            }
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  key: Key('task_${task.id}'),
                  leading: Checkbox(
                    value: task.completed,
                    onChanged: (_) => _toggle(context, task),
                  ),
                  title: Text(task.title,
                      style: TextStyle(
                        decoration: task.completed ? TextDecoration.lineThrough : null,
                      )),
                  subtitle: Text(task.description),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => TaskFormScreen(repository: repository, task: task),
                    ),
                  ),
                  trailing: IconButton(
                    tooltip: 'Eliminar',
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => _delete(context, task),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (_) => TaskFormScreen(repository: repository),
            ),
          ),
          icon: const Icon(Icons.add),
          label: const Text('Nueva tarea'),
        ),
      );
}
