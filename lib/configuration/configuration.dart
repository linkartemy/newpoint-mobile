import 'package:flutter_dotenv/flutter_dotenv.dart';

class Configuration {
  static String? apiHost = dotenv.env['API_IP'];
  static int apiPort = int.parse(dotenv.env['API_PORT'].toString());
  static String? apiKey = dotenv.env['API_KEY'];

  static String? grpcHost = dotenv.env['GRPC_IP'];
  static int grpcPort = int.parse(dotenv.env['GRPC_PORT'].toString());
  static String? grpcKey = dotenv.env['GRPC_KEY'];
}
