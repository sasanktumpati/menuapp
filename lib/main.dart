import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'hive/hive_registrar.g.dart';
import 'routing.dart';
import 'utils/logger/provider_observer/prov_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  runApp(
    ProviderScope(
      observers: [
        ProvObserver(),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> initHive() async {
  try {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);
    Hive.registerAdapters();

    await Future.wait([
      Hive.openBox('menuBox'),
      Hive.openBox('timingBox'),
    ]);
  } catch (e) {
    debugPrint('Error initializing Hive: $e');
    rethrow;
  }
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final navigationRouter = ref.watch(navigationProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'messmenu',
      routerConfig: navigationRouter,
    );
  }
}
