import 'package:get_it/get_it.dart';
import 'package:l3_gov_portal/core/navigation/app_navigation_service.dart';
import 'package:l3_gov_portal/core/navigation/navigation_observer.dart';

// import 'package:l3_gov_portal/core/navigation/navigation_observer.dart';
final GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton<AppNavigationService>(
    () => AppNavigationService(),
  );
  getIt.registerLazySingleton<AppNavigationObserver>(
    () => AppNavigationObserver(),
  );
}

Future<void> resetLocator() async {
  await getIt.reset();
  setupLocator();
}
