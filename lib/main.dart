import 'package:flutter/material.dart';
import 'package:gym/Features/Splash/presentation/view_model/views/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

const String resetTask = "com.example.stepResetTask";

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == resetTask) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('steps', 0);
      await prefs.remove('baseline');
      await prefs.setString('lastResetTime', DateTime.now().toIso8601String());
    }
    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: false,
  );

  await Workmanager().registerPeriodicTask(
    "step-reset-task",
    resetTask,
    frequency: const Duration(hours: 12),
    initialDelay: const Duration(minutes: 1),
    constraints: Constraints(
      networkType: NetworkType.notRequired,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
