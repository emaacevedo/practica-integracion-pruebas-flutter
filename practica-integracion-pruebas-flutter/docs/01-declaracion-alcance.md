# Declaración de alcance

| Módulo o servicio | Aplica | Observación |
|---|---|---|
| Autenticación | No | Prototipo sin cuentas |
| Firestore | Sí | Colección `tasks`, CRUD |
| Storage | No | No maneja archivos |
| FCM | No | No envía notificaciones |
| API REST externa | No | Sin servicios externos |
| Analytics / Crashlytics | No | Fuera del alcance |

**Plataforma objetivo:** Android. **Pantallas:** listado y formulario (crear/editar).
**Seguridad:** para producción se requiere autenticación y reglas por usuario; el modo demostración debe usar reglas restringidas y temporales, nunca acceso público permanente.
