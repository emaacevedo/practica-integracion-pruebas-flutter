# Práctica de integración y pruebas Flutter

Gestor de tareas con Flutter, dos pantallas, Firebase Cloud Firestore, validación y CRUD. Proyecto académico de Semana 16.

## Requisitos
Flutter SDK compatible con Dart >=3.4, Android SDK, cuenta Firebase y dispositivo/emulador Android.

## Preparación
La plataforma objetivo es Android. Si su copia no contiene `android/`, genere esa carpeta con `flutter create --platforms=android .`.
1. Abra esta carpeta y prepare un emulador o dispositivo Android.
2. Ejecute `flutter pub get`.
3. Configure un proyecto Firebase propio y registre la aplicación Android.
4. Instale FlutterFire CLI: `dart pub global activate flutterfire_cli`.
5. Configure: `flutterfire configure --platforms=android` y agregue los archivos de configuración requeridos por Firebase. Si genera `lib/firebase_options.dart`, puede ajustar `main.dart` para inicializar con `DefaultFirebaseOptions.currentPlatform`.
6. **Seguridad:** las reglas incluidas en `firebase/firestore.rules` deniegan todo. Para pruebas reales, utilice Firestore Emulator o configure Firebase Authentication y reglas que permitan únicamente los datos del usuario. No publique reglas `allow read, write: if true` para una base en Internet.
7. Ejecute `flutter run`.

## Prueba local con el emulador de Firestore

Con Firebase CLI y Java 21 disponibles, ejecute en una terminal:

```bash
firebase emulators:start --only firestore --project demo-practica-flutter --config firebase/emulator.json
```

En otra terminal, con un emulador Android iniciado y los archivos de configuración Android del paso de preparación presentes, ejecute:

```bash
flutter run --dart-define=USE_FIRESTORE_EMULATOR=true
```

La app conecta al Firestore local por `10.0.2.2:8080`. La interfaz del emulador está en `http://127.0.0.1:4000/firestore`. Mantenga Firestore abierto al reiniciar la app para verificar la persistencia. Las reglas de `firebase/firestore.emulator.rules` son exclusivamente para este entorno local.

## Pruebas y análisis
```bash
flutter analyze
flutter test
```
Las pruebas unitarias y de widget usan un repositorio falso y no necesitan credenciales Firebase.

## Git y entrega
```bash
git init
git checkout -b semana16-integracion
git add .
git commit -m "feat: estructura inicial y CRUD de tareas"
```
Crear en GitHub un repositorio público `practica-integracion-pruebas-flutter` y subir rama y commits. Documentar incidencias reales con commits `fix: INC-001 ...`.

## Evidencias pendientes (no fabricadas)
- Capturas reales de la aplicación y Firestore.
- Salidas de `flutter analyze` y `flutter test`.
- Mínimo 10 casos ejecutados y 3 incidencias reales documentadas.
- Al menos una corrección con commit y prueba de regresión.
- Completar reflexión final basada en resultados reales.

## Alcance
Firestore sí. Auth, Storage, FCM, API REST externa y otros no. Este prototipo sin Auth requiere entorno controlado para operaciones reales.
