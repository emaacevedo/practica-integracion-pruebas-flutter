# Mapa de flujos críticos

1. El usuario puede iniciar la aplicación y visualizar la lista de tareas desde Firestore.
2. El usuario puede crear una tarea válida y verla en el listado.
3. El usuario puede intentar guardar una tarea sin título y recibir validación sin escribir en Firestore.
4. El usuario puede editar una tarea y marcarla como completada.
5. El usuario puede eliminar una tarea y comprobar su desaparición del listado.

**Flujo E2E principal:** iniciar → crear → consultar → editar → completar → eliminar → reiniciar.
