import 'package:flutter/material.dart';
import '../data/firestore_task_repository.dart';
import '../models/task.dart';
import '../utils/task_validator.dart';

class TaskFormScreen extends StatefulWidget {
  const TaskFormScreen({super.key, required this.repository, this.task});
  final TaskRepository repository;
  final Task? task;

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _title;
  late final TextEditingController _description;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController(text: widget.task?.title ?? '');
    _description = TextEditingController(text: widget.task?.description ?? '');
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate() || _saving) return;
    setState(() => _saving = true);
    try {
      final task = widget.task;
      if (task == null) {
        await widget.repository.create(_title.text, _description.text);
      } else {
        await widget.repository.update(task.copyWith(
          title: _title.text,
          description: _description.text,
        ));
      }
      if (mounted) Navigator.of(context).pop();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo guardar. Intenta nuevamente.')),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(widget.task == null ? 'Nueva tarea' : 'Editar tarea')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  key: const Key('titleField'),
                  controller: _title,
                  decoration: const InputDecoration(labelText: 'Título'),
                  validator: TaskValidator.validateTitle,
                  maxLength: 80,
                ),
                TextFormField(
                  key: const Key('descriptionField'),
                  controller: _description,
                  decoration: const InputDecoration(labelText: 'Descripción'),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                FilledButton(
                  key: const Key('saveButton'),
                  onPressed: _saving ? null : _save,
                  child: Text(_saving ? 'Guardando...' : 'Guardar'),
                ),
              ],
            ),
          ),
        ),
      );
}
