import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'data/firestore_task_repository.dart';
import 'screens/task_list_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const useEmulator = bool.fromEnvironment('USE_FIRESTORE_EMULATOR');
  final app = useEmulator
      ? await Firebase.initializeApp(
          name: 'local-firestore',
          options: const FirebaseOptions(
            apiKey: 'demo-api-key',
            appId: '1:1:android:1',
            messagingSenderId: '1',
            projectId: 'demo-practica-flutter',
          ),
        )
      : await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
  final firestore = FirebaseFirestore.instanceFor(app: app);
  if (useEmulator) {
    firestore.settings = const Settings(persistenceEnabled: false);
    firestore.useFirestoreEmulator('10.0.2.2', 8080);
  }
  runApp(TaskApp(repository: FirestoreTaskRepository(firestore: firestore)));
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key, required this.repository});
  final TaskRepository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mis tareas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: TaskListScreen(repository: repository),
    );
  }
}
