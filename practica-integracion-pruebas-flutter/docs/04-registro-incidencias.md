# Registro de incidencias

> Las filas marcadas «Por verificar» son candidatas a inspección.

| ID | Candidato / riesgo | Severidad estimada | Prioridad | Origen | Estado |
|---|---|---|---|---|---|
| INC-001 | La suite no compila por una referencia a `MyApp` | Alta | Alta | Pruebas automatizadas | Corregida y verificada. Commit pendiente |
| INC-002 | Lista vacía sin mensaje | Baja | Media | UI | Por verificar |
| INC-003 | Guardado duplicado por doble pulsación | Media | Alta | UI/servicio | Por verificar |

## INC-001 — Prueba de la plantilla desactualizada

- **Fecha y entorno.** 17 de noviembre de 2026, Flutter en Windows.
- **Reproducción.** Ejecutar el análisis y `flutter test`. Se esperaba que compilara toda la suite. Cinco pruebas pasaron y `test/widget_test.dart` falló al compilar con el mensaje `Couldn't find constructor 'MyApp'`.
- **Hipótesis y comprobación.** La prueba seguía usando el contador de la plantilla. Al revisar `lib/main.dart` se comprobó que la aplicación expone `TaskApp` y requiere un repositorio.
- **Corrección y regresión.** La prueba ahora inicia `TaskApp` con `FakeTaskRepository` y verifica el título de la pantalla, el mensaje de lista vacía y el botón para crear una tarea.
- **Verificación.** [Análisis sin errores](evidencias/pruebas-y-analisis/flutter-analyze.txt) y [seis pruebas aprobadas](evidencias/pruebas-y-analisis/flutter-test.txt).
- **Commit.** Pendiente de registrar en la rama `semana16-integracion`.

## Plantilla por incidencia

- **ID:**
- **Fecha y entorno:**
- **Severidad / prioridad / origen:**
- **Pasos para reproducir:**
- **Resultado esperado:**
- **Resultado obtenido:**
- **Evidencia inicial:**
- **Hipótesis y comprobación:**
- **Causa raíz:**
- **Corrección:**
- **Commit (`fix: INC-...`):**
- **Prueba de regresión y evidencia:**
- **Estado final:**

## Método de depuración
Reproducir → leer salida/log → formular hipótesis → comprobar → corregir y proteger con prueba.

