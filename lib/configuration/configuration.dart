import 'package:flutter_dotenv/flutter_dotenv.dart';

class Configuration {
  static String? apiHost = dotenv.env['API_IP'];
  static int apiPort = dotenv.env['API_PORT'] as int;
  static String? apiKey = dotenv.env['API_KEY'];
}
