# Registro de pruebas funcionales

> **Pendiente de ejecución real.** No cambiar a Aprobado sin captura, salida verificable y repetición tras reiniciar.

| ID | Módulo | Entrada / acción | Esperado | Obtenido | Estado | Evidencia |
|---|---|---|---|---|---|---|
| CP-01 | Arranque | `flutter run --dart-define=USE_FIRESTORE_EMULATOR=true` en emulador Android | Pantalla Mis tareas sin excepción | Instaló el APK y mostró Mis tareas con el mensaje de lista vacía | Ejecutado una vez, pendiente repetir tras reiniciar | [Captura](evidencias/capturas-aplicacion/01-arranque-lista-vacia.png) |
| CP-02 | Navegación | Pulsar Nueva tarea | Abre formulario | Pendiente | No ejecutado | Pendiente |
| CP-03 | Validación | Título vacío, Guardar | Mensaje obligatorio; no escribe | Pendiente | No ejecutado | Pendiente |
| CP-04 | Datos | Crear tarea «Tarea de prueba» | La tarea se muestra en el listado y aparece un documento en Firestore | Visible en el listado. La consulta al emulador devolvió el documento con el título ingresado | Ejecutado una vez, pendiente repetir tras reiniciar | [Captura](evidencias/capturas-aplicacion/02-tarea-creada.png), [respuesta de Firestore local](evidencias/firebase/01-tarea-creada-emulador.json) |
| CP-05 | Datos | Abrir listado | Tarea visible y ordenada | Pendiente | No ejecutado | Pendiente |
| CP-06 | Datos | Cambiar título | Actualiza UI y Firestore | Pendiente | No ejecutado | Pendiente |
| CP-07 | Datos | Marcar checkbox | completed=true | Pendiente | No ejecutado | Pendiente |
| CP-08 | Datos | Eliminar tarea | Documento desaparece | Pendiente | No ejecutado | Pendiente |
| CP-09 | Estados | Lista vacía | Mensaje No hay tareas | Pendiente | No ejecutado | Pendiente |
| CP-10 | Estados | Sin conexión | Mensaje controlado, sin cierre | Pendiente | No ejecutado | Pendiente |
| CP-11 | Persistencia | Reiniciar app | Recupera tareas desde Firestore | Pendiente | No ejecutado | Pendiente |
| CP-12 | E2E | Crear→editar→completar→eliminar | Flujo completo sin excepción | Pendiente | No ejecutado | Pendiente |

## Pruebas automatizadas

- Unitaria: `test/unit/task_validator_test.dart`.
- Widget con fake: `test/widget/task_form_test.dart`.
- Evidencia: adjuntar salida de `flutter test` y `flutter analyze` en `docs/evidencias/pruebas-y-analisis/`.
