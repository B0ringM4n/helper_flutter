import 'package:meta/meta.dart';

class MyException implements Exception {
  final String code;
  final String message;
  final dynamic details;
  final String stacktrace;

  MyException({
    @required this.code,
    @required this.message,
    this.details = "Sin Detalles",
    this.stacktrace = "Sin Trazos",
  })  : assert(code != null),
        assert(message != null);

  @override
  String toString() =>
      'PlatformException($code, $message, $details, $stacktrace)';
}
