import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class StepsAndCaloriesCard extends StatefulWidget {
  const StepsAndCaloriesCard({super.key});

  @override
  _StepsAndCaloriesCardState createState() => _StepsAndCaloriesCardState();
}

class _StepsAndCaloriesCardState extends State<StepsAndCaloriesCard>
    with WidgetsBindingObserver {

  final double _caloriesPerStep = 0.04;

  int? _baseline;
  StreamSubscription<StepCount>? _stepCountSubscription;
  DateTime? _lastResetTime;
  SharedPreferences? _prefs;

  final ValueNotifier<int> _stepsNotifier = ValueNotifier(0);
  final ValueNotifier<bool> _permissionGrantedNotifier = ValueNotifier(false);

  static const MethodChannel _permissionChannel = MethodChannel('com.example.gym/permissions');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initPrefsAfterFrame();
    });
  }

  Future<void> _initPrefsAfterFrame() async {
    _prefs = await SharedPreferences.getInstance();
    _stepsNotifier.value = _prefs?.getInt('steps') ?? 0;
    _baseline = _prefs?.getInt('baseline');
    String? lastReset = _prefs?.getString('lastResetTime');
    _lastResetTime = lastReset != null ? DateTime.parse(lastReset) : DateTime.now();
    await _checkAndResetIfNeeded();
    await _checkAndRequestPermission();
  }

  Future<void> _checkAndRequestPermission() async {
    bool granted = await _permissionChannel.invokeMethod('checkActivityPermission');
    if (!granted) {
      granted = await _permissionChannel.invokeMethod('requestActivityPermission');
    }
    _permissionGrantedNotifier.value = granted;
    if (granted) _initPedometer();
  }

  void _initPedometer() {
    _stepCountSubscription?.cancel();
    _stepCountSubscription = Pedometer.stepCountStream.listen(
          (event) async {
        if (!_permissionGrantedNotifier.value) return;
        if (_baseline == null) {
          _baseline = event.steps;
          await _prefs?.setInt('baseline', _baseline!);
        }
        int steps = event.steps - _baseline!;
        if (steps < 0) steps = 0;
        _stepsNotifier.value = steps;
        await _prefs?.setInt('steps', steps);
      },
      onError: (error) => debugPrint('Step Count Error: $error'),
    );
  }

  Future<void> _checkAndResetIfNeeded() async {
    final now = DateTime.now();
    if (_lastResetTime == null || now.day != _lastResetTime!.day) {
      _stepsNotifier.value = 0;
      _baseline = null;
      _lastResetTime = now;
      await _prefs?.setInt('steps', 0);
      await _prefs?.remove('baseline');
      await _prefs?.setString('lastResetTime', now.toIso8601String());
    }
  }

  @override
  void dispose() {
    _stepCountSubscription?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    _stepsNotifier.dispose();
    _permissionGrantedNotifier.dispose();
    super.dispose();
  }

  /// هذا الجزء يضمن تحديث البريميشن عند العودة من صفحة الإعدادات
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _checkPermissionOnResume();
    }
  }

  Future<void> _checkPermissionOnResume() async {
    try {
      bool granted = await _permissionChannel.invokeMethod('checkActivityPermission');
      if (granted != _permissionGrantedNotifier.value) {
        _permissionGrantedNotifier.value = granted;
        if (granted) _initPedometer();
      }
    } catch (e) {
      debugPrint("Error checking permission on resume: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    Widget buildCard({
      required IconData icon,
      required String label,
      required ValueNotifier<String> valueNotifier,
    }) {
      return Expanded(
        child: ValueListenableBuilder<bool>(
          valueListenable: _permissionGrantedNotifier,
          builder: (context, granted, _) {
            return GestureDetector(
              onTap: () async {
                if (!granted) {
                  await _permissionChannel.invokeMethod('requestActivityPermission');
                }
              },
              child: Container(
                height: screenWidth * 0.25,
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: const Color(0xFF2D3748).withOpacity(0.85),
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: screenWidth * 0.025,
                      offset: Offset(0, screenWidth * 0.01),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          icon,
                          color: icon == Icons.directions_run
                              ? const Color(0xFF10b981)
                              : const Color(0xffe67d05),
                          size: screenWidth * 0.06,
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        ValueListenableBuilder<String>(
                          valueListenable: valueNotifier,
                          builder: (context, value, _) {
                            return Text(
                              value,
                              style: TextStyle(
                                color: granted ? Colors.white : Colors.grey,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Text(
                      label,
                      style: TextStyle(
                        color: granted ? Colors.white : Colors.grey,
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w500,
                        decoration: !granted ? TextDecoration.underline : null,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }

    final stepsValueNotifier = ValueNotifier(_stepsNotifier.value.toString());
    _stepsNotifier.addListener(() {
      stepsValueNotifier.value = _stepsNotifier.value.toString();
    });

    final caloriesValueNotifier =
    ValueNotifier((_stepsNotifier.value * _caloriesPerStep).toStringAsFixed(2));
    _stepsNotifier.addListener(() {
      caloriesValueNotifier.value =
          (_stepsNotifier.value * _caloriesPerStep).toStringAsFixed(2);
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildCard(
            icon: Icons.directions_run,
            label: 'Steps',
            valueNotifier: stepsValueNotifier),
        SizedBox(width: screenWidth * 0.04),
        buildCard(
            icon: Icons.local_fire_department,
            label: 'Calories',
            valueNotifier: caloriesValueNotifier),
      ],
    );
  }
}
