import 'package:flutter/material.dart';
import 'package:l2_a_o_registration/pages/initial_registration_page/initial_registration_page_widget.dart';
import 'package:l2_a_o_registration/pages/registration/registration_widget.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const RegistrationWidget(),
        );

      default:
        return onUnknownRoute(settings);
    }
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }
}
