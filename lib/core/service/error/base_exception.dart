import 'package:flutter/foundation.dart';

class BaseException implements Exception {
  final Exception exception;
  final StackTrace stackTrace;

  BaseException(this.exception, this.stackTrace) {
    debugPrint('\x1B[32m$exception\x1B[0m');

    // Sentry.captureException(exception, stackTrace: stackTrace);
  }
}
