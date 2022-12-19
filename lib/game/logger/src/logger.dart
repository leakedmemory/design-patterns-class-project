// ignore_for_file: avoid_print

class Logger {
  static final Logger _instancy = Logger._internal();

  Logger._internal();

  factory Logger() {
    return _instancy;
  }

  void log(String message) {
    final currentTime = DateTime.now();
    print('LOG: $currentTime: $message');
  }
}
