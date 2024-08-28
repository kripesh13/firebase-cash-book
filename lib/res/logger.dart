import 'package:logger/logger.dart';

final Logger logger = Logger(
  filter: null, // Use the default LogFilter (allows all logs)
  printer: PrettyPrinter(), // Use the default printer (outputs logs in a human-readable format)
  output: null, // By default, logs are output to the console
);
