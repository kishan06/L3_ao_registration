import 'package:flutter/material.dart';
import 'package:l3_gov_portal/core/navigation/redirection_data/app_redirect_data.dart';
import 'package:l3_gov_portal/core/navigation/redirection_data/driving_license_home_redirect_data.dart';
import 'package:l3_gov_portal/core/navigation/redirection_data/vehicle_registration_home_redirect_data.dart';

class AppNavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  void pop() {
    navigatorKey.currentState?.pop();
  }

  void pushNamedWithArguments(String routeName, Object? arguments) {
    navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  void pushReplacementNamedWithArguments(String routeName, Object? arguments) {
    navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  void pushNamedAndRemoveUntil(
    String routeName,
    bool Function(Route<dynamic>) predicate,
    Object? arguments,
  ) {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      predicate,
      //arguments,
    );
  }

  Future<dynamic> handleRedirection(
      String routeName, AppRedirectData redirectData) async {
    if (redirectData.clearNavigationStack) {
      return pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        redirectData,
      );
    } else if (redirectData.replaceRoute) {
      return pushReplacementNamedWithArguments(
        routeName,
        redirectData,
      );
    } else {
      return pushNamedWithArguments(
        routeName,
        redirectData,
      );
    }
  }

  Future<dynamic> redirect(AppRedirectData redirectData) async {
    switch (redirectData.redirectType) {
      case AppRedirectType.drivingLicenseHome:
        return _handleDrivingLicenseHomeRedirect(
            redirectData as DrivingLicenseHomeRedirectData);
      case AppRedirectType.vehicleRegistrationHome:
        return _handleVehicleRegistrationHomeRedirect(
            redirectData as VehicleRegistrationHomeRedirectData);
      default:
        throw Exception('Unknown redirect type');
    }
  }

  Future<dynamic> _handleDrivingLicenseHomeRedirect(
      DrivingLicenseHomeRedirectData redirectData) async {
    return handleRedirection(
      '/driving-license-home',
      redirectData,
    );
  }

  Future<dynamic> _handleVehicleRegistrationHomeRedirect(
      VehicleRegistrationHomeRedirectData redirectData) async {
    return handleRedirection(
      '/vehicle-registration-home',
      redirectData,
    );
  }
}
