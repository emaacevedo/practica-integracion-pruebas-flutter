import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practica_integracion_pruebas_flutter/screens/task_form_screen.dart';
import '../fakes/fake_task_repository.dart';

void main() {
  testWidgets('formulario vacío no llama al repositorio', (tester) async {
    final repository = FakeTaskRepository();
    addTearDown(repository.dispose);

    await tester.pumpWidget(MaterialApp(
      home: TaskFormScreen(repository: repository),
    ));
    await tester.tap(find.byKey(const Key('saveButton')));
    await tester.pump();

    expect(find.text('El título es obligatorio'), findsOneWidget);
    expect(repository.createCalls, 0);
  });

  testWidgets('formulario válido guarda una tarea', (tester) async {
    final repository = FakeTaskRepository();
    addTearDown(repository.dispose);

    await tester.pumpWidget(MaterialApp(
      home: TaskFormScreen(repository: repository),
    ));
    await tester.enterText(find.byKey(const Key('titleField')), 'Estudiar Flutter');
    await tester.tap(find.byKey(const Key('saveButton')));
    await tester.pumpAndSettle();

    expect(repository.createCalls, 1);
    expect(repository.tasks.single.title, 'Estudiar Flutter');
  });
}
