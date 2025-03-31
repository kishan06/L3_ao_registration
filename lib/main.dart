import 'dart:async';
import 'package:flutter/material.dart';
import 'package:l3_gov_portal/core/di/service_locator.dart';
import 'package:l3_gov_portal/core/navigation/app_navigation_service.dart';
import 'package:l3_gov_portal/core/navigation/navigation_observer.dart';
import 'package:l3_gov_portal/core/navigation/router.dart';
import 'package:l3_gov_portal/utils/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  FlutterError.onError = (FlutterErrorDetails details) {
    Logger.error(details.exceptionAsString(), details.stack);
  };
  runZonedGuarded(
    () {
      runApp(const MyGovApp());
    },
    (error, stackTrace) {
      Logger.error('Uncaught error: $error', stackTrace);
    },
  );
}

class MyGovApp extends StatelessWidget {
  const MyGovApp({super.key});
  @override
  Widget build(BuildContext context) {
    final navigatorKey = getIt<AppNavigationService>().navigatorKey;
    return MaterialApp(
      title: 'Ao Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: navigatorKey,
      navigatorObservers: [
        getIt<AppNavigationObserver>(),
      ],
      onGenerateRoute: AppRouter.generateRoute,
      onUnknownRoute: AppRouter.onUnknownRoute,
    );
  }
}
