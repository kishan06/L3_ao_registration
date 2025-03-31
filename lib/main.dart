import 'dart:async';
import 'package:flutter/material.dart';
import 'package:l2_a_o_registration/pages/initial_registration_page/initial_registration_page_widget.dart';
import 'package:l3_gov_portal/core/di/service_locator.dart';
import 'package:l3_gov_portal/core/navigation/app_navigation_service.dart';
import 'package:l3_gov_portal/core/navigation/navigation_observer.dart';
import 'package:l3_gov_portal/core/navigation/router.dart';
import 'package:l3_gov_portal/utils/logger.dart';
import 'package:go_router/go_router.dart';
import 'package:l2_a_o_registration/pages/registration/registration_widget.dart';

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
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const RegistrationWidget(),
        ),
        GoRoute(
          name: 'Initial_registration_page',
          path: '/initialRegistrationPage',
          builder: (context, state) => const InitialRegistrationPageWidget(),
        ),
        // Add other routes here
      ],
    );

    return MaterialApp.router(
      title: 'Ao Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: router,
    );
  }
}
