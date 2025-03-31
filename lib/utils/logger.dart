import 'package:flutter/foundation.dart';

enum LogLevel { info, warning, error, debug }

class Logger {
  static void log(String? message, {LogLevel level = LogLevel.info}) {
    if (kDebugMode) {
      final formattedMessage = _formatMessage(message, level);
      print(formattedMessage);
    }
  }

  static void info(String? message) {
    log(message, level: LogLevel.info);
  }

  static void warning(String? message) {
    log(message, level: LogLevel.warning);
  }

  static void error(String? message, [StackTrace? stackTrace]) {
    log(message, level: LogLevel.error);
    if (stackTrace != null) {
      print(stackTrace);
    }
  }

  static void debug(String? message) {
    log(message, level: LogLevel.debug);
  }

  static String _formatMessage(String? message, LogLevel level) {
    final timestamp = DateTime.now().toIso8601String();
    final levelString = level.toString().split('.').last.toUpperCase();
    return "[$timestamp] [$levelString] $message";
  }
}
