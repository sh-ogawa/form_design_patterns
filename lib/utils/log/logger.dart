import 'package:form_design_patterns/utils/log/log_code.dart' as code;
import 'package:simple_logger/simple_logger.dart';

/// logger wrapper
class Logger {
  final logger = SimpleLogger()
    ..setLevel(Level.ALL, includeCallerInfo: true)
    ..formatter = (info) {
      var buffer = StringBuffer()
        ..write(DateTime.now())
        ..write('\t')
        ..write(info.level)
        ..write('\t')
        ..write(info.message)
        ..write('\t')
        ..write(info.callerFrame);
      return buffer.toString();
    };

  /// output debug log
  void debug(String message) {
    logger.finest(message);
  }

  /// out put log from logcode
  void log(String logCode, {
    List<dynamic> params = const []
  }) {
    var logMessage = code.logCode[logCode] ?? 'not found logCode';
    String message = "$logCode\t$logMessage";

    switch(logCode.substring(0, 1)) {
      case 'I':
        logger.info(message);
        break;
      case 'W':
        logger.warning(message);
        break;
      case 'E':
        logger.severe(message);
        break;
      default:
        throw ArgumentError("unknown logCode type. only use I, W, E");
    }
  }
}