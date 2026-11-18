import 'package:flutter_test/flutter_test.dart';
import 'package:practica_integracion_pruebas_flutter/main.dart';

import 'fakes/fake_task_repository.dart';

void main() {
  testWidgets('la aplicación muestra el listado vacío al iniciar',
      (tester) async {
    final repository = FakeTaskRepository();
    addTearDown(repository.dispose);

    await tester.pumpWidget(TaskApp(repository: repository));
    await tester.pumpAndSettle();

    expect(find.text('Mis tareas'), findsOneWidget);
    expect(find.text('No hay tareas. Crea la primera.'), findsOneWidget);
    expect(find.text('Nueva tarea'), findsOneWidget);
  });
}
